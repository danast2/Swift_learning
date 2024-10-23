//
//  subscripts.swift
//  Swift_learning
//
//  Created by Даниил Асташов on 23.10.2024.
//

import Foundation


//Сабскрипты уже встречались вам ранее, в частности, при работе с массивами
//и словарями. Они использовались для доступа к отдельным значениям коллекций
//по их индексу. Однако сабскрипты позволяют значительно упростить работу со
//структурами и классами.
//23.1. Назначение сабскриптов
//С помощью сабскриптов структуры и классы можно превратить в некое подобие
//коллекций. У вас есть возможность организовать доступ к свойствам экземпляра
//с использованием специальных ключей (индексов).
//Предположим, что нами разработан класс Chessboard, моделирующий сущность
//«шахматная доска». Экземпляр данного класса хранится в переменной desk:
//var desk = Chessboard()
//В одном из свойств данного экземпляра содержится информация о том, какая
//клетка поля какой шахматной фигурой занята. Для доступа к информации относительно определенной клетки мы можем разработать специальный метод,
//которому в качестве входных параметров будут передаваться координаты:
//desk.getCellInfo("A", 5)
//С помощью сабскриптов можно организовать доступ к ячейкам клетки, передавая
//координаты, подобно ключам массива, непосредственно экземпляру класса:
//desk["A", 5]
//ПРИМЕЧАНИЕ Сабскрипты доступны для структур и классов.


//23.2. Синтаксис сабскриптов
//В своей реализации сабскрипты являются чем-то средним между методами
//и вычисляемыми свойствами. От первых им достался синтаксис определения
//выходных параметров и типа возвращаемого значения, от вторых — возможность
//создания геттера и сеттера.
//23.2. Синтаксис сабскриптов   353
//СИНТАКСИС
//subscript(входные_параметры) —> тип_возвращаемого_значения {
// get {
// // тело геттера
// }
// set(ассоциированныйПараметр) {
// // тело сеттера
// }
//}


//Сабскрипты объявляются в теле класса или структуры с помощью ключевого слова subscript.
//Далее указываются входные параметры (в точности так же, как у методов) и тип значения.
//Входные параметры — это значения, которые передаются в виде ключей. Тип значения
//указывает на тип данных устанавливаемого (в случае сеттера) или возвращаемого (в случае
//геттера) значения.
//Тело сабскрипта заключается в фигурные скобки и состоит из геттера и сеттера по аналогии
//с вычисляемыми значениями. Геттер выполняет код при запросе значения с использованием
//сабскрипта, сеттер — при попытке установить значение.
//Сеттер также дает возможность дополнительно указать имя ассоциированного параметра,
//которому будет присвоено устанавливаемое значение. Если данный параметр не будет указан,
//то новое значение автоматически инициализируется локальной переменной newValue. При
//этом тип данных параметра будет соответствовать типу возвращаемого значения.
//Сеттер является необязательным, и в случае его отсутствия может быть использован сокращенный синтаксис:
//subscript(входные_параметры) —> возвращаемое_значение {
// // тело геттера
//}



//Сабскрипты поддерживают перегрузку, то есть в пределах одного объектного типа
//может быть определено произвольное количество сабскриптов, различающихся
//лишь набором входных аргументов.
//ПРИМЕЧАНИЕ С перегрузками мы встречались, когда объявляли несколько функций с одним
//именем или несколько инициализаторов в пределах одного объектного типа. Каждый набор
//одинаковых по имени объектов отличался лишь набором входных аргументов.
//Для изучения сабскриптов вернемся к теме шахмат и создадим класс, описывающий сущность «шахматная доска». При разработке модели шахматной доски
//у нее можно выделить одну наиболее важную характеристику: коллекцию игровых
//клеток с указанием информации о находящихся на них шахматных фигурах. Не
//забывайте, что игровое поле — это матрица, состоящая из отдельных ячеек.
//В данном примере будет использоваться созданный ранее тип Chessman, описывающий шахматную фигуру, включая вложенные в него перечисления.
//При разработке класса шахматной доски реализуем метод, устанавливающий
//переданную ему фигуру на игровое поле. При этом стоит помнить о двух моментах
//фигура, возможно, уже находилась на поле, а значит, ее требуется удалить со
//старой позиции;
// фигура имеет свойство сoordinates, которое также необходимо изменять.
//В листинге 23.1 показан код класса GameDesk, описывающего шахматную доску.

class GameDesk {
 var desk: [Int:[String:Chessman_p]] = [:]
 init() {
     for i in 1...8 {
         desk[i] = [:]
     }
 }
 func setChessman(chess: Chessman_p , coordinates: (String, Int)) {
     let rowRange = 1...8
     let colRange = "A"..."Z"
     if( rowRange.contains( coordinates.1 ) && colRange.contains ( coordinates.0 )) {
         self.desk[coordinates.1]![coordinates.0] = chess
         chess.setCoordinates(char: coordinates.0, num: coordinates.1)
     } else {
         print("Coordinates out of range")
     }
 }
}


//Класс GameDesk описывает игровое поле. Его единственным свойством является
//коллекция клеток, на которых могут располагаться шахматные фигуры (экземпляры класса Chessman).
//При создании экземпляра свойству desk устанавливается значение по умолчанию
//«пустой словарь». Во время работы инициализатора в данный словарь записываются значения, соответствующие номерам строк на шахматной доске. Это делается для того, чтобы обеспечить безошибочную работу при установке фигуры
//на шахматную клетку. В противном случае при установке фигуры нам пришлось
//бы сначала узнать состояние линии (существует ли она в словаре), а уже потом
//записывать фигуру на определенные координаты.
//Метод setChessman(chess:coordinates:) не просто устанавливает ссылку на фигуру в свойство desk, он также проверяет переданные координаты на корректность
//и устанавливает их в экземпляре фигуры.
//Пока что в классе GameDesk отсутствует возможность запроса информации о произвольной ячейке. Реализуем ее с помощью сабскрипта (листинг 23.2). В сабскрипт
//будут передаваться координаты необходимой ячейки в виде двух отдельных
//входных аргументов. Если по указанным координатам существует фигура, то она
//возвращается, в противном случае возвращается nil.

class GameDesk_n {
 var desk: [Int:[String:Chessman_p]] = [:]
 init() {
     for i in 1...8 {
         desk[i] = [:]
     }
 }
 // сабскрипт из листинга 2
 subscript(alpha: String, number: Int) -> Chessman_p? {
     get {
         return self.desk[number]![alpha]
     }
 }
 func setChessman(chess: Chessman_p , coordinates: (String, Int)) {
     let rowRange = 1...8
     let colRange = "A"..."Z"
     if( rowRange.contains( coordinates.1 ) && colRange.contains ( coordinates.0 )) {
         self.desk[coordinates.1]![coordinates.0] = chess
         chess.setCoordinates(char: coordinates.0, num: coordinates.1)
     } else {
         print("Coordinates out of range")
     }
     }
}
var game = GameDesk()
var queenBlack_p = Chessman_p(type: .queen, color: .black, figure: "\u{265B}", coordinates: ("A", 6))
//game.setChessman(chess: queenBlack, coordinates: ("A",3))
//game["A",3]?.coordinates // (.0 "A", .1 3)


//Реализованный сабскрипт имеет только геттер, причем в данном случае можно
//было использовать краткий синтаксис записи (без ключевого слова get).
//Так как сабскрипт возвращает опционал, то перед доступом к свойству coordinates
//возвращенной шахматной фигуры необходимо выполнить извлечение опционального значения.
//Теперь мы имеем возможность установить фигуры на шахматную доску с помощью
//метода setChessman(chess:coordinates:) и получить информацию об отдельной
//ячейке с помощью сабскрипта.
//Мы можем расширить функциональность сабскрипта, добавив в него сеттер, позволяющий устанавливать фигуру на новые координаты (листинг 23.3)


class GameDesk_p {
 var desk: [Int:[String:Chessman_p]] = [:]
 init(){
     for i in 1...8 {
         desk[i] = [:]
     }
 }
 subscript(alpha: String, number: Int) -> Chessman_p? {
     get {
         return self.desk[number]![alpha]
     }
     set {
         if let chessman = newValue {
             self.setChessman(chess: chessman, coordinates: (alpha, number))
         } else {
             self.desk[number]![alpha] = nil
         }
     }
 }
 func setChessman(chess: Chessman_p , coordinates: (String, Int)) {
     let rowRange = 1...8
     let colRange = "A"..."H"
     if( rowRange.contains( coordinates.1 ) && colRange.contains(coordinates.0 ) ) {
         self.desk[coordinates.1]![coordinates.0] = chess
         chess.setCoordinates(char: coordinates.0, num: coordinates.1)
     } else {
         print("Coordinates out of range")
     }
     }
}
var game_n = GameDesk()
var queenBlack_n = Chessman_p(type: .queen, color: .black, figure: "\u{265B}", coordinates: ("A", 6))
//game["C",5] = queenBlack
//game["C",5] // Chessman
//game["C",5] = nil
//game["C",5] // nil
