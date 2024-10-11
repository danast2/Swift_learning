//
//  the_main_control_operators.swift
//  Swift_learning
//
//  Created by Даниил Асташов on 11.10.2024.
//

import Foundation

//утверждения
/*Swift позволяет прервать выполнение программы в случае, когда некоторое условие не выполняется: к примеру, если значение переменной отличается от требуемого. Для этого предназначен специальный механизм утверждений (assertions).
 Утверждения в Swift реализованы в виде глобальной функции assert(_:_:).*/
// утверждение с двумя аргументами
//assert( someVar > 100, "Данные неверны" )
// утверждение с одним аргументом
//assert( anotherVar <= 10 )

let strName = "Дракон"
let strYoung = "молод"
let strOld = "стар"
let strEmpty = " "
var dragonAge = 230
//assert( dragonAge <= 235, strName+strEmpty+strOld )
//assert( dragonAge >= 225, strName+strEmpty+strYoung )
//print("Программа успешно завершила свою работу")


var dragonAge_new = 220
//assert( dragonAge_new <= 235, strName+strEmpty+strOld )
//assert( dragonAge_new >= 225, strName+strEmpty+strYoung )
//print("Программа успешно завершила свою работу")
//Консоль
//Assertion failed: Дракон молод


//опрератор if

/*Оператор условия if имеет четыре формы записи, различающиеся по синтаксису
 и функциональным возможностям:
  сокращенная;
  стандартная;
  расширенная;
  тернарная*/

//сокращенный синтаксис
/*if userName == "Alex" {
 print("Привет, администратор")
}*/
