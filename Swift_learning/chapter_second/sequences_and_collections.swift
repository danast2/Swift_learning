//
//  sequences.swift
//  Swift_learning
//
//  Created by Даниил Асташов on 06.10.2024.
//

import Foundation

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
