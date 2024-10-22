//
//  the_console_game_guess_the_number.swift
//  Swift_learning
//
//  Created by Даниил Асташов on 22.10.2024.
//

import Foundation


// генерация случайного числа
let randomNumber = UInt8.random(in: 1...250)
//print("Компьютер случайным образом загадал число. Вам требуется отгадать его.")
// в переменную будет записываться число с консоли
var myNumber: String?
// цикл с постпроверкой условия
/*repeat {
 print("Введите ваш вариант и нажмите Enter")
 // получение значения с клавиатуры пользователя
 myNumber = readLine()
 // сравнение введенного и сгенерированного чисел
 if (UInt8(myNumber!) == randomNumber) {
 print("Вы угадали!")
 } else if (UInt8(myNumber!)! < randomNumber) {
 print("Ваш вариант меньше загаданного числа")
 } else if (UInt8(myNumber!)! > randomNumber) {
 print("Ваш вариант больше загаданного числа")
 }
} while randomNumber != UInt8(myNumber!)
*/


/**print("Компьютер случайным образом загадал число. Вам требуется отгадать его.")
 // Случайное число
 let randomNumber = UInt8.random(in: 1...250)
 print("Введите вариант числа от 1 до 250 и нажмите Enter")
 // флаг-указатель на победу
 var isWin = false
 repeat {
  // попытка преобразования введенного значения к UInt8
  guard let userNumber = UInt8(readLine() ?? "") else {
  print("Вы ввели некорректное число. Попробуйте снова")
  continue
  }
  // проверка введенного числа
  if userNumber < randomNumber{
    print("Ваш вариант меньше загаданного числа")
  } else if userNumber > randomNumber {
    print("Ваш вариант больше загаданного числа")
  } else {
    print("Вы угадали")
    isWin = true
  }
 } while !isWin*/
