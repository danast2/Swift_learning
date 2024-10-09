//
//  set.swift
//  Swift_learning
//
//  Created by Даниил Асташов on 09.10.2024.
//

import Foundation

/*В Swift множества (sets) — это коллекции уникальных значений без определенного порядка. Они могут содержать элементы любого типа, который соответствует протоколу Hashable. Множества удобны для хранения уникальных элементов и выполнения операций, таких как объединение, пересечение и разность*/

let mySet: Set<Int> = [1,5,0]
let mySetNew: Set = [22, 8, 335]
let mySet1 = Set<Int>(arrayLiteral: 3, 6, 8)
let mySet2 = Set(arrayLiteral: 3, 6, 8)

var dishes: Set<String> = ["хлеб", "овощи", "тушенка", "вода"]
var dishesTwo: Set = ["хлеб", "овощи", "тушенка", "вода"]
var members = Set<String>(arrayLiteral: "Энакин", "Оби Ван", "Йода")
var membersTwo = Set(arrayLiteral: "Энакин", "Оби Ван", "Йода")

//пустое множество

// создание пустого множества
let emptySet = Set<String>()
// множество со значениями
var setWithValues: Set<String> = ["хлеб", "овощи"]
// удаление всех элементов множества
//setWithValues = []
//setWithValues // Set([])

//Базовые свойства и методы множеств

// создаем пустое множество
var musicStyleSet: Set<String> = []
// добавляем к нему новый элемент
//musicStyleSet.insert("Jazz") // (inserted true, memberAfterInsert "Jazz")
//musicStyleSet // {"Jazz"}

// создание множества со значениями
//musicStyleSet = ["Jazz", "Hip-Hop", "Rock"]
// удаляем один из элементов
var removeStyleResult = musicStyleSet.remove("Hip-Hop")
//removeStyleResult // "Hip-Hop"
//musicStyleSet // {"Jazz", "Rock"}
// удаляем несуществующий элемент
//musicStyleSet.remove("Classic") // nil
// удаляем все элементы множества
//musicStyleSet.removeAll()
//musicStyleSet // Set([])

/*
musicStyleSet = ["Jazz", "Hip-Hop", "Rock", "Funk"]
// проверка существования значения во множестве
musicStyleSet.contains("Funk") // true
musicStyleSet.contains("Pop") // false
*/


//операции со множествами

// множество с нечетными цифрами
let oddDigits: Set = [1, 3, 5, 7, 9]
// множество с четными цифрами
let evenDigits: Set = [0, 2, 4, 6, 8]
// множество со смешанными цифрами
let differentDigits: Set = [3, 4, 7, 8]
