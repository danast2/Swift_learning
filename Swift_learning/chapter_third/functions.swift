//
//  functions.swift
//  Swift_learning
//
//  Created by Даниил Асташов on 17.10.2024.
//

import Foundation

func myFirstFunc(a: Int, b: String) -> String {
 String(a) + b
}
func printMessage() {
 print("Сообщение принято")
}
// вызываем функцию по ее имени
//printMessage()
//printMessage()


func sumTwoInt(a: Int, b: Int) {
 print("Результат операции - \(a+b)")
}

/*Внешние имена входных параметров
Аргументы a и b функции sumTwoInt(a:b:) используются как при вызове функции,
так и в ее теле (там они называются входными параметрами). Swift позволяет
указать внешние имена параметров, которые будут использоваться при вызове
функции (листинг 12.3).*/
func sumTwoInt(num1 a: Int, num2 b: Int) {
 print("Результат операции - \(a+b)")
}
//sumTwoInt(num1: 10, num2: 12)

//Если внешнее имя заменить на символ нижнего подчеркивания (_), то при вызове
//функции имя параметра вообще не потребуется указывать (листинг 12.4).
//Листинг 12.4
func sumTwoInt(_ a: Int, _ b: Int) {
 print("Результат операции - \(a+b)")
}

//sumTwoInt(10, 12) //22

func sumTwoInt_new(_ a: Int, _ b: Int) -> Int {
 let result = a + b
 print("Результат операции - \(result)")
 return result
}
var result = sumTwoInt_new(10, 12) // 22

/**Изменяемые копии входных параметров
 Все входные параметры функции — константы. При попытке изменения их значения внутри тела функции происходит ошибка. При необходимости изменения
 переданного входного значения внутри функции потребуется создать новую
 переменную и присвоить переданное значение ей (листинг 12.6).*/

func returnMessage(code: Int, message: String) -> String {
 var mutableMessage = message
 mutableMessage += String(code)
 return mutableMessage
}
let myMessage = returnMessage(code: 200, message: "Код сообщения - ")
//Функция returnMessage(code:message:) получает на вход два аргумента: code
//и message. В ее теле создается изменяемая копия message, которая без каких-либо
//ошибок модифицируется, после чего возвращается
