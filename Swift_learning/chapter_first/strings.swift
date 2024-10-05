//
//  strings.swift
//  Swift_learning
//
//  Created by Даниил Асташов on 03.10.2024.
//

import Foundation

func str(){
    let char: Character = "a"
    let string: String = "DanAst____"
    var emptyString = ""
    var anotherEmptyString = String()
    /**При попытке инициализировать пустой строковый литерал параметру типа Character Xcode сообщит об ошибке несоответствия типов, так как
     пустая строка не является отдельным символом (рис. 2.5). Она является пустой
     строкой.*/
    let longString = 
    """
     Это многострочный
     строковый литерал
    """
    let notEmptyString = String("Hello, DanAst")
    
    // константа типа Double
    let someDoubleNumber = 74.22
    // строка, созданная на основе константы типа Double
    let someStringNumber = String(someDoubleNumber) // "74.22"
    
    // переменная типа String
    let name = "Дракон"
    // константа типа String c использованием интерполяции
    let hello = "Привет, меня зовут \(name)!"
    // интерполяция с использованием выражения
    let meters: Double = 10
    let text = "Моя длина \(meters * 3.28) фута"
    // выведем значения на консоль
    print(hello)
    print(text)
    
    
    // константа типа String
    let firstText = "Мой вес "
    // переменная типа Double
    let weight = 12.4
    // константа типа String
    let secondText = " тонны"
    // конкатенация строк при инициализации значения новой переменной
    let resultText = firstText + String(weight) + secondText
    print(resultText)
    
    let firstString = "Swift"
    let secondString = "Objective-C"
    let anotherString = "Swift"
    firstString == secondString // false
    firstString == anotherString // true
    
    print(char)
}

