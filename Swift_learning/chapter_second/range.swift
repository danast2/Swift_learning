//
//  range.swift
//  Swift_learning
//
//  Created by Даниил Асташов on 07.10.2024.
//

import Foundation

/*Знакомиться с типами данных, относящимися к последовательностям и коллекциям, начнем с диапазонов — специальных типов, позволяющих создавать
 упорядоченные множества последовательных значений. Диапазоны могут быть
 конечными и бесконечными, ограниченными слева, справа или с двух сторон.
 Примером диапазона может служить интервал, включающий целочисленные
 значения от 1 до 100, следующие по порядку (1, 2, 3 ... 99, 100).
 Диапазоны позволяют значительно экономить память компьютера, так как для
 хранения любого множества (пусть даже с миллионами элементов) необходимо
 указать лишь начальное и конечное значение. Все промежуточные элементы будут
 рассчитаны автоматически в ходе последовательного перебора.*/

// ОПЕРЫТОРЫ ПОЛУОТКРЫТОГО ДИАПАЗОНА

//бинарная форма ОПЕРАТОРА
let myRange = 1..<500

// задаем тип данных явно
let someRangeInt: Range<Int> = 1..<10
//type(of:someRangeInt) // Range<Int>.Type
// тип данных определен автоматически
// на основании переданного значения (неявно)
let anotherRangeInt = 51..<59
//type(of:anotherRangeInt) // Range<Int>.Type
let rangeInt: Range<Int> = 1..<10

// диапазон с элементами типа String
let rangeString = "a"..<"z"
//type(of:rangeString) // Range<String>.Type
// диапазон с элементами типа Character
let rangeChar: Range<Character> = "a"..<"z"
//type(of:rangeChar) // Range<Character>.Type
// диапазон с элементами типа Double
let rangeDouble = 1.0..<5.0
//type(of:rangeDouble) // Range<Double>.Type

let firstElement = 10
var lastElement = 18
let myBestRange = firstElement..<lastElement

//префиксная форма ОПЕРАТОРА
let myRangeNew = ..<500
let oneSideRange = ..<5
//type(of: oneSideRangeNew) // PartialRangeUpTo<Int>.Type


//ОПЕРАТОРЫ ЗАКРЫТОГО ДИАПАЗОНА

//бинарная форма ОПЕРАТОРА
let myRangenew = 1...100
let fullRange = 1...10
//type(of: fullRange) // ClosedRange<Int>.Type

//постфиксная форма ОПЕРАТОРА
let myRange1 = 10...

let infRange = 2...
//type(of: infRange) // PartialRangeFrom<Int>.Type
let collection = [1, 6, 76, 12, 51]
//print( collection[infRange] )
//Консоль
//[76, 12, 51]

//префиксная форма ОПЕРАТОРА
let myRange22 = ...0


//базовые свойства и методы

/*contains(_:)
 
 Описание: Проверяет, содержит ли диапазон указанное значение.
 Пример
 */
let range = 1..<5
//print(range.contains(3))  // true
//print(range.contains(5))  // false


/*lowerBound и upperBound
 
 Описание: Свойства, возвращающие нижнюю и верхнюю границы диапазона соответственно.
 Пример
 */

let range1 = 1..<5
//print(range.lowerBound)  // 1
//print(range.upperBound)  // 5

/*overlaps(_:)
 
 Описание: Определяет, пересекается ли диапазон с другим диапазоном.
 Пример
 */

let range11 = 1..<5
let range2 = 3..<7
//print(range11.overlaps(range2))  // true

/*clamped(to:)
 
 Описание: Возвращает диапазон, ограниченный другим диапазоном.
 Пример
 */
let range3 = 1..<10
let clampedRange = range3.clamped(to: 3..<7)
//print(clampedRange)  // 3..<7

/*isEmpty
 
 Описание: Возвращает true, если диапазон пуст (нижняя граница равна верхней границе).
 Пример
 */

let range = 1..<1
//print(range.isEmpty)  // true

/**/
