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

//Тип данных массива

// Массив с типом данных [String] или Array<String>
let firstAr = Array(arrayLiteral: "a", "b", "c") // ["a", "b", "c"]
//type(of: firstAr) // Array<String>.Type
// Массив с типом данных [Int] или Array<Int>
let secondAr = Array(1..<5) // [1, 2, 3, 4]
//type(of: secondAr) // Array<Int>.Type

let arrayOne: Array<Character> = ["a", "b", "c"]
let arrayTwo: [Int] = [1, 2, 5, 8, 11]

//Массив - это value type
// исходный массив
let parentArray = ["one", "two", "three"]
// создаем копию массива
var copyParentArray = parentArray
//copyParentArray // ["one", "two", "three"]
// изменяем значение в копии массива
//copyParentArray[1] = "four"
// выводим значение массивов
//parentArray // ["one", "two", "three"]
//copyParentArray // // ["one", "four", "three"]


//Пустой массив

/* объявляем массив с пустым значением
 с помощью переданного значения */
let emptyArray: [String] = [] // []
 /* объявляем массив с пустым значением
 с помощью специальной функции */
let anotherEmptyArray = [String]() // []

//операции с массивами

/* три константы, которые
 cтанут элементами массива */
let a1 = 1
let a2 = 2
let a3 = 3
var someArray = [1, 2, 3]
//someArray == [a1, a2, a3] // true

//слияние массивов

// создаем три массива
let charsOne = ["a", "b", "c"]
let charsTwo = ["d", "e", "f"]
let charsThree = ["g", "h", "i"]
// создаем новый слиянием двух
var alphabet = charsOne + charsTwo
// сливаем новый массив с третьим
//alphabet += charsThree
//alphabet // ["a", "b", "c", "d", "e", "f", "g", "h", "i"]

//многомерные массивы
var arrayOfArrays = [[1,2,3], [4,5,6], [7,8,9]]

//arrayOfArrays = [[1,2,3], [4,5,6], [7,8,9]]
// получаем вложенный массив
//arrayOfArrays[2] // [7, 8, 9]
// получаем элемент вложенного массива
//arrayOfArrays[2][1] // 8



//Базовые свойства и методы массивов
let someArrayNew = [1, 2, 3, 4, 5]
// количество элементов в массиве
//someArray.count // 5

let emptyArrayNew: [Int] = []
//emptyArray.count // 0
//emptyArray.isEmpty // true

var numArray = [1, 2, 3, 4, 5]
// количество элементов в массиве
let sliceOfArray = numArray[numArray.count-3...numArray.count-1] // [3, 4, 5]

let subArray = numArray.suffix(3) // [3, 4, 5]

/*// возвращает первый элемент массива
numArray.first // 1
// возвращает последний элемент массива
numArray.last // 5

numArray // [1, 2, 3, 4, 5]
numArray.append(6) // [1, 2, 3, 4, 5, 6]

numArray // [1, 2, 3, 4, 5, 6]
// вставляем новый элемент в середину массива
numArray.insert(100, at: 2) // [1, 2, 100, 3, 4, 5, 6]


numArray // [1, 2, 100, 3, 4, 5, 6]
// удаляем третий элемент массива (с индексом 2)
numArray.remove(at: 2) // 100
// удаляем первый элемент массива
numArray.removeFirst() // 1
// удаляем последний элемент массива
numArray.removeLast() // 6
/* итоговый массив содержит
 всего четыре элемента */
numArray // [2, 3, 4, 5]

numArray // [2, 3, 4, 5]
// удаляем последний элемент
numArray.dropLast() // [2, 3, 4]
// удаляем три первых элемента
let anotherNumArray = numArray.dropFirst(3)
anotherNumArray // [5]
numArray // [2, 3, 4, 5]

numArray // [2, 3, 4, 5]
 // проверка существования элемента
let resultTrue = numArray.contains(4) // true
let resultFalse = numArray.contains(10) // false

let randomArray = [3, 2, 4, 5, 6, 4, 7, 5, 6]
// поиск минимального элемента
randomArray.min() // 2
// поиск максимального элемента
randomArray.max() // 7

var myAlphaArray = ["a", "bb", "ccc"]
myAlphaArray.reverse()
myAlphaArray // ["ccc", "bb", "a"]

// исходная неотсортированная коллекция
let unsortedArray = [3, 2, 5, 22, 8, 1, 29]
// метод sorted() возвращает отсортированную последовательность
// при этом исходный массив не изменяется
let sortedArray = unsortedArray.sorted()
unsortedArray // [3, 2, 5, 22, 8, 1, 29]
sortedArray // [1, 2, 3, 5, 8, 22, 29]
// метод sort() изменяет исходный массив
unsortedArray.sort()
unsortedArray // [1, 2, 3, 5, 8, 22, 29]

let moneyArray = [50, 100, 500, 1000, 5000]
let randomMoneyElement = moneyArray.randomElement()*/


//Срезы массивов (ArraySlice)

// исходный массив
let arrayOfNumbers = Array(1...10)
// его тип данных - Array<Int>
//type(of: arrayOfNumbers) // Array<Int>.Type
//arrayOfNumbers // [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
// получим часть массива (подмассив)
let slice = arrayOfNumbers[4...6]
//slice // [5, 6, 7]
// его тип данных отличается от типа исходного массива
//type(of: slice) // ArraySlice<Int>.Type

//операции с ArraySlice

//type(of: slice) // ArraySlice<Int>.Type
let arrayFromSlice = Array(slice)
//type(of: arrayFromSlice) // Array<Int>.Type

//let newArray: Array<UInt> = arrayOfNumbers.dropLast()
//type(of: newArray) // Array<UInt>.Type

// исходный массив
//arrayOfNumbers // [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
// его срез, полученный в одном из предыдущих листингов
//slice // [5, 6, 7]
// отдельный элемент
//arrayOfNumbers[5] // 6
//slice[5] // 6

/*Массивы в Swift — это структуры, а значит, они передаются по значению (при копировании создается новый экземпляр массива). Однако если вы хотите передавать массивы по ссылке, можно использовать класс NSMutableArray из фреймворка Foundation.
*/

let mutableArr: NSMutableArray = ["apple", "orange", "grape"]

func editArr(_ array: NSMutableArray){
    array.adding("cherry")
    array.removeObject(at: 0)
}

// До вызова функции
//print("Массив до изменений: \(mutableArray)")

//editArr(mutableArr)

//print("Массив после изменений: \(mutableArray)")
