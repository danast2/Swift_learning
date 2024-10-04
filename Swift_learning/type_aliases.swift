//
//  type_aliases.swift
//  Swift_learning
//
//  Created by Даниил Асташов on 04.10.2024.
//

import Foundation

/*В Swift есть возможность создать псевдоним для любого типа данных. Псевдонимом типа называется дополнительное имя, по которому будет происходить обращение к этому типу. Для создания псевдонима используется оператор typealias.
 Псевдоним нужен тогда, когда существующее имя типа неудобно использовать
 в контексте программы (листинг 2.42).*/

typealias AgeType = UInt8
/* создаем переменную типа UInt8,
используя псевдоним */
var myAge: AgeType = 29

// определяем псевдоним для типа String
typealias TextType = String
typealias WordType = String
typealias CharType = String
// создаем константы каждого типа
let someText: TextType = "Это текст"
let someWord: WordType = "Слово"
let someChar: CharType = "Б"
let someString: String = "Строка типа String"

// объявляем псевдоним
typealias AgeTypeNew = UInt8
/* используем свойство типа
UInt8 через его псевдоним */
let maxAge = AgeTypeNew.max // 255

/*Для Swift обращение к псевдониму равносильно обращению к самому типу данных. Псевдоним — это ссылка на тип. В данном примере используется псевдоним
 AgeType для доступа к типу данных UInt8 и свойству max.*/
