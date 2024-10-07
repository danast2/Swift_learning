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


//БИНАРНАЯ ФОРМА ОПЕРАТОРА
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

//ПРЕФИКСНАЯ ФОРМА ОПЕРАТОРА
let myRangeNew = ..<500
let oneSideRange = ..<5
//type(of: oneSideRangeNew) // PartialRangeUpTo<Int>.Type
