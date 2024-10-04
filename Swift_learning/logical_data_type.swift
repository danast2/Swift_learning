//
//  logical_data_type.swift
//  Swift_learning
//
//  Created by Даниил Асташов on 04.10.2024.
//

import Foundation

let some : Bool = true
let someBool = true

let firstBool = true, secondBool = true, thirdBool = false
// группируем различные условия
let one = firstBool && secondBool // true
let two = firstBool && thirdBool // false
let three = firstBool && secondBool && thirdBool // false

/**Оператор логического И определяет, есть ли среди переданных ему операндов
 ложные значения.
 Бинарный оператор логического ИЛИ — это удвоенный символ прямой черты
 и является инфиксным. Он возвращает true, когда хотя бы один из операндов
 имеет значение true. Если значения обоих операндов равны false, то возвращается
 значение false (листинг 2.38).*/

// группируем различные условия
let one1 = firstBool || secondBool // true
let two2 = firstBool || thirdBool // true
let three3 = secondBool || thirdBool // false
/*Оператор логического ИЛИ определяет, есть ли среди значений переданных ему
операндов хотя бы одно истинное.
Логические операторы можно группировать между собой, создавая сложные
логические структуры. Пример показан в листинге 2.39*/


let firstBool1 = true, secondBool2 = false, thirdBool3 = false
 let resultBool = firstBool1 && secondBool2 || thirdBool3 // false
 let resultAnotherBool = thirdBool3 || firstBool1 && firstBool1 // true
 /*При вычислении результата выражения Swift определяет значение подвыражений
 последовательно, то есть сначала первого, потом второго и т. д.
 Указать порядок вычисления операций можно с помощью круглых скобок (точно
 как в математических примерах). То, что указано в скобках, будет выполняться
 в первую очередь (листинг 2.40)*/
