//
//  sequences.swift
//  Swift_learning
//
//  Created by Даниил Асташов on 06.10.2024.
//

import Foundation
//простая реализация массива

/*Массив как коллекция (Collection):
 
 Массивы в Swift соответствуют протоколу Collection, который предоставляет функции для доступа к элементам по индексам, измерения длины коллекции, а также итерации по элементам.
 Коллекция — это структура данных, которая хранит множество элементов и предоставляет доступ к этим элементам через индексы.
 Массивы предоставляют возможность выполнять операции с элементами (доступ, модификация, вставка и удаление) на основе индексов.
 Массив как последовательность (Sequence):

 Массивы также соответствуют протоколу Sequence, который определяет поведение объектов, по которым можно итерировать.
 Последовательность — это структура данных, которая может быть проитерирована (например, с помощью цикла for-in). Последовательность не обязана поддерживать индексацию, но массивы поддерживают её, так как они ещё и коллекция.*/
struct myArray<T>{
    private var buffer: UnsafeMutablePointer<T>? //указатель на начало массива
    private var _count: Int = 0 //текущее количество элементов
    private var _capacity: Int = 0 //максимальная емкость массива
    
    /*Здесь инициализатор пустой, потому что массив создаётся без элементов и с нулевой ёмкостью. Структура может начинать с _count = 0 и _capacity = 0, пока не будет добавлен первый элемент*/
    init(){}
    
    //метод для добавления нового элемента
    mutating func append(_ element: T){
        if _count == _capacity{
            // увеличить емкость, если она заполенена
            _capacity = max(1, _capacity * 2)
            let newBuffer = UnsafeMutablePointer<T>.allocate(capacity: _capacity)
            
            //копируем старые данные в новый буфер
            if let buffer = buffer{
                newBuffer.initialize(from: buffer, count: _count)
                buffer.deallocate()
            }
            
            buffer = newBuffer
        }
        //добавляем новый элемент
        buffer?.advanced(by: _count).initialize(to: element)
        _count += 1
    }
    
    //Доступ по индексу
    subscript(index: Int) -> T{
        return buffer!.advanced(by: index).pointee
    }
    
    var count: Int {
        return _count
    }
}


//реализация последовательности (простого итератора)
/*Итератор не хранит все элементы у себя. Он просто знает, как получить следующий элемент.
Он позволяет перебирать элементы по одному, не имея доступа ко всей последовательности сразу.
Краткий вывод:
Итератор — это механизм, который позволяет поочерёдно доставать элементы из последовательности, как будто ты достаёшь конфеты из коробки одну за одной, пока все не закончатся.*/
struct MyIterator: IteratorProtocol{
    var current = 0
    
    mutating func next() -> Int?{
        current+=1
        return current <= 5 ? current:nil
    }
}

var iter = MyIterator()
/*
while let number = iter.next(){
    print(number)
}*/

/*Generators (Custom Sequence Implementation)
  можно создать свою собственную последовательность, которая не будет коллекцией, используя Sequence и IteratorProtocol. Например, это может быть последовательность, которая возвращает элементы из источника данных по запросу.*/
//пример с возвращением случайных чисел
struct RandNumGen: Sequence, IteratorProtocol{
    mutating func next() -> Int? {
        return Int.random(in: 1...100)
    }
}

var randNum = RandNumGen()

/*for _ in 0..<5 {
    print(randNum.next()!)
}
*/
