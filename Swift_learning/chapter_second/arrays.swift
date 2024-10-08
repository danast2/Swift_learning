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
//repeatArray // ["Swift", "Swift", "Swift", "Swift", "Swift"]

//доступ к элементам массива
// неизменяемый массив
let alphabetArray1 = ["a", "b", "c"]
// изменяемый массив
var mutableArray1 = [2, 4, 8]
// доступ к элементам массивов
//alphabetArray1[1] // "b"
//mutableArray1[2] // 8

// изменяемый массив
var mutableArray2 = [2, 4, 8]
// изменение элемента массива
//mutableArray2[1] = 16
// вывод нового массива
//mutableArray2 // [2, 16, 8]


// изменяемый массив
var stringsArray = ["one", "two", "three", "four"]
// заменим несколько элементов
//stringsArray[1...2] = ["five"]
//stringsArray // ["one", "five", "four"]
//stringsArray[2] // "four"
