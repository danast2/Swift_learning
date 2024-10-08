//
//  arrays.swift
//  Swift_learning
//
//  Created by Даниил Асташов on 08.10.2024.
//

import Foundation

/*массив - это упорядоченная коллекция однотипных элементов, для
 доступа к которым используются целочисленные индексы. Упорядоченной называется коллекция, в которой элементы располагаются в порядке, определенном
 разработчиком.*/

// неизменяемый массив
// с элементами типа String
let alphabetArray = ["a", "b", "c"]
// изменяемый массив
// с элементами типа Int
var mutableArray = [2, 4, 8]

// создание массива с помощью передачи списка значений
let newAlphabetArray = Array(arrayLiteral: "a", "b", "c")
//newAlphabetArray // ["a", "b", "c"]

// создание массива с помощью оператора диапазона
let lineArray = Array(0...9)
//lineArray // [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

// создание массива с повторяющимися значениями
let repeatArray = Array(repeating: "Swift", count: 5)
repeatArray // ["Swift", "Swift", "Swift", "Swift", "Swift"]
