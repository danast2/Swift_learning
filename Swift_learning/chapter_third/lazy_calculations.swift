//
//  lazy_calculations.swift
//  Swift_learning
//
//  Created by Даниил Асташов on 22.10.2024.
//

import Foundation


//понятие ленивых вычислений

//«Ленивый» в Swift звучит как lazy. Можно сказать, что lazy — синоним производительности. Хорошо оптимизированные программы практически всегда используют
//ленивые вычисления. Возможно, вы работали с ними и в других языках. В любом
//случае внимательно изучите приведенный далее материал.
//В программировании ленивыми называются такие элементы, вычисление значений которых откладывается до момента обращения к ним. Таким образом, пока
//значение не потребуется и не будет использовано, оно будет храниться в виде
//сырых исходных данных. С помощью ленивых вычислений достигается экономия
//процессорного времени, то есть компьютер не занимается ненужными в данный
//момент вычислениями.
//Существует два типа ленивых элементов:
// lazy-by-name — значение элемента вычисляется при каждом обращении к нему;
// lazy-by-need — элемент вычисляется один раз при первом обращении к нему,
//после чего фиксируется и больше не изменяется.
//Swift позволяет работать с обоими типами ленивых элементов, но в строгом соответствии с правилами.


//замыкания в ленивых вычислениях

//С помощью замыканий мы можем создавать ленивые конструкции типа lazy-byname, значение которых высчитывается при каждом обращении к ним.
//Рассмотрим пример из листинга 15.1.


var arrayOfNames_new = ["Helga", "Bazil", "Alex"]
//print(arrayOfNames.count)
let nextName = { arrayOfNames_new.remove(at: 0) }

//arrayOfNames.count //3
//nextName()
//arrayOfNames.count //2


//В константе nextName хранится замыкание, удаляющее первый элемент массива
//arrayOfNames. Несмотря на то что константа объявлена, а ее значение проинициализировано, количество элементов массива не уменьшается до тех пор, пока не
//произойдет обращение к хранящемуся в ней замыканию.
//Если пойти дальше, то можно сказать, что любая функция или метод являются
//lazy-by-name, так как их значение высчитывается при каждом обращении.


//свойство lazy

//Некоторые конструкции языка Swift (например, массивы и словари) имеют свойство lazy, позволяющее преобразовать их в ленивые. Наиболее часто это происходит, когда существуют цепочки вызова свойств или методов и выделение памяти
//и вычисление промежуточных значений является бесполезной тратой ресурсов,
//так как эти значения никогда не будут использованы.
//Рассмотрим следующий пример: существует массив целых чисел, значения которого непосредственно не используются в работе программы. Вам требуется
//лишь результат его обработки методом map(_:), и то не в данный момент, а позже
//(листинг 15.2)

let baseCollection_new = [1,2,3,4,5,6]
let myLazyCollection = baseCollection_new.lazy
//type(of:myLazyCollection) // LazySequence<Array<Int>>.Type
let collection_new = myLazyCollection.map{$0 + 1}
//type(of:collection) // LazyMapSequence<Array<Int>, Int>.Type


//В результате выполнения возвращается ленивая коллекция. При этом память под
//отдельный массив целочисленных значений не выделяется, а вычисления метода
//map(_:) не производятся до тех пор, пока не произойдет обращение к константе
//collection.
//Вся прелесть такого подхода в том, что вы можете увеличивать цепочки вызовов,
//но при этом лишнего расхода ресурсов не будет (листинг 15.3).


let resultCollection = [1,2,3,4,5,6].lazy.map{$0 + 1}.filter{$0 % 2 == 0}
//Array(resultCollection) // [2, 4, 6]
