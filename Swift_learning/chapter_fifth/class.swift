//
//  class.swift
//  Swift_learning
//
//  Created by Даниил Асташов on 23.10.2024.
//

import Foundation


//Классы, наравне со структурами, являются очень функциональными конструкциями, которые используются при разработке приложений. В этой главе мы рассмотрим их основные возможности и отличия от других объектных типов.
//Классы довольно сильно похожи на структуры, они точно так же позволяют создать программный образ любой сущности, наделить ее свойствами и методами.
//Но у этих конструктивных элементов есть несколько ключевых особенностей.
//Тип. Класс — это ссылочный тип (reference type). Экземпляры класса передаются
//по ссылке, а не копированием.
//Изменяемость. Экземпляр класса может изменять значения своих свойств, объявленных как переменная (var), даже если сам экземпляр хранится в константе
//(let). При этом использовать ключевое слово mutating для методов не требуется.
//Наследование. Два класса могут быть в отношении «родительский — дочерний»
//друг к другу. При этом подкласс наследует и включает в себя все характеристики
//(свойства иметоды) суперкласса и при необходимости может быть дополнительно
//расширен. Наследование подробно рассматривается в главе 24.
//Инициализатор (конструктор). Класс имеет только пустой встроенный инициализатор init(), который не требует передачи значения входных параметров для
//их инициализации свойствам.
//Деинициализатор (деструктор). Swift позволяет создать деинициализатор — специальный метод, который автоматически вызывается при удалении экземпляра
//класса.
//Приведение типов. В процессе выполнения программы вы можете проверить
//экземпляр класса на соответствие определенному типу данных.
//Каждая из особенностей детально разбирается в книге.
//Наверняка у вас возник вопрос о том, зачем же Swift предоставляет нам столь
//похожие элементы, как структуры и классы. У каждого из них на самом деле своя
//область применения, со временем вы научитесь определять наиболее подходящие
//конструкции для решения возникающих задач.


class Chessman {
 // тип фигуры
 let type: String
 // цвет фигуры
 let color: String
 // координаты фигуры
 var coordinates: (String, Int)? = nil
 // символ, соответствующий фигуре
 let figureSymbol: Character
 // инициализатор
 init(type: String, color: String, figure: Character) {
 self.type = type
 self.color = color
 figureSymbol = figure
 }
}
// создаем экземпляр фигуры
var kingWhite = Chessman(type: "king", color: "white", figure: "\u{2654}")


//Каждая из характеристик фигуры выражена в отдельном свойстве класса. Тип
//данных свойства coordinate является опциональным кортежем. Это связано
//с тем, что фигура может быть убрана с игрового поля (тогда свойство будет nil).
//Координаты фигуры на шахматном поле задаются с помощью строки и числа.
//В разработанном инициализаторе указаны входные аргументы, значения которых
//используются в качестве значений свойств экземпляра.
//ПРИМЕЧАНИЕ Обратите внимание, что для доступа к свойству figureSymbol мы не используем self, но при желании вы можете его добавить. Использование self для доступа
//к свойствам type и color обусловлено тем, что входные параметры инициализатора имеют те
//же самые имена, что и свойства класса.
//В результате выполнения кода в переменной kingWhite находится экземпляр класса Chessman, описывающий фигуру «Белый король». Фигура еще не имеет координат, а значит, не выставлена на игровое поле (ее координаты соответствуют nil).
//21.3. Методы классов   339
//Свойства type и color могут принять значения из четко определенного перечня,
//поэтому имеет смысл реализовать два перечисления: одно должно содержать типы
//шахматных фигур, второе — цвета (листинг 21.2).


// тип шахматной фигуры
enum ChessmanType {
 case king, castle, bishop, pawn, knight, queen
}
// цвета фигур
enum ChessmanColor {
 case black, white
}

//Созданные перечисления должны найти место в качестве типов соответствующих
//свойств класса Chessman. Не забывайте, что и входные аргументы инициализатора
//должны измениться соответствующим образом (листинг 21.3).

class Chessman_n {
 let type: ChessmanType
 let color: ChessmanColor
 var coordinates: (String, Int)? = nil
 let figureSymbol: Character
 init(type: ChessmanType, color: ChessmanColor, figure: Character) {
     self.type = type
     self.color = color
     figureSymbol = figure
 }
}
var kingWhite_n = Chessman_n(type: .king, color: .white, figure: "\u{2654}")

//методы классов

//Сущность «Шахматная фигура» уже является вполне рабочей. На ее основе можно
//описать любую фигуру. Тем не менее описанная фигура все еще является «мертвой» в том смысле, что не может быть использована непосредственно для игры.
//Это связано с тем, что механизмы, позволяющие установить фигуру на игровое
//поле и динамически ее перемещать, еще не разработаны.
//Классы, как и структуры с перечислениями, могут содержать произвольные
//методы, обеспечивающие функциональную нагрузку класса. Не забывайте, что
//340   Глава 21. Классы
//в классах нет необходимости использовать ключевое слово mutating для методов,
//меняющих значения свойств.
//Немного оживим созданную модель шахматной фигуры, создав несколько методов,
//решающих следующие задачи (листинг 21.4):
// установка координат фигуры (при выставлении на поле или при движении);
// снятие фигуры с игрового поля (окончание партии или взятие фигуры).


class Chessman_d {
     let type: ChessmanType
     let color: ChessmanColor
    var coordinates: (String, Int)? = nil
    let figureSymbol: Character
 init(type: ChessmanType, color: ChessmanColor, figure:Character) {
     self.type = type
     self.color = color
     figureSymbol = figure
 }
 // установка координат
 func setCoordinates(char c:String, num n: Int) {
     coordinates = (c, n)
 }
 // взятие фигуры
 func kill() {
     coordinates = nil
 }
}
let kingWhite_d = Chessman_d(type: .king, color: .white, figure: "\u{2654}")
//kingWhite.setCoordinates(char: "E", num: 1)


//инициализаторы классов

//Класс может содержать произвольное количество разработанных инициализаторов, различающихся лишь набором входных аргументов. Это никоим образом
//не влияет на работу самого класса, а лишь дает нам более широкие возможности
//при создании его экземпляров.
//Рассмотрим процесс создания дополнительного инициализатора. Существующий
//класс Chessman не позволяет одним выражением создать фигуру и выставить ее
//на поле. Сейчас для этого используются два независимых выражения. Давайте
//разработаем второй инициализатор, который будет дополнительно принимать
//координаты фигуры (листинг 21.5).


class Chessman_s {
     let type: ChessmanType
     let color: ChessmanColor
     var coordinates: (String, Int)? = nil
     let figureSymbol: Character
 init(type: ChessmanType, color: ChessmanColor, figure:Character){
     self.type = type
     self.color = color
     figureSymbol = figure
 }
 init(type: ChessmanType, color: ChessmanColor, figure: Character,
 coordinates: (String, Int)) {
     self.type = type
     self.color = color
     figureSymbol = figure
     setCoordinates(char: coordinates.0, num: coordinates.1)
 }
 func setCoordinates(char c:String, num n: Int){
     coordinates = (c, n)
 }
 func kill() {
     coordinates = nil
 }
}
var queenBlack = Chessman_s(type: .queen, color: .black, figure: "\u{2655}",
 coordinates: ("A", 6))


//Так как код установки координат уже написан вметоде setCoordinates(char:num:),
//то во избежание дублирования в инициализаторе этот метод просто вызывается.
//При объявлении нового экземпляра в окне автодополнения будут предлагаться
//на выбор два инициализатора, объявленные в классе Chessman.


//вложенные в класс типы

//Очень часто перечисления, структуры и классы создаются для того, чтобы расширить функциональность и удобство использования определенного типа данных.
//Такой подход мы встречали, когда разрабатывали перечисления ChessmanColor
//и ChessmanType, использующиеся в классе Chessman. В данном случае перечисления
//нужны исключительно в контексте класса, описывающего шахматную фигуру,
//и нигде больше.
//В такой ситуации вы можете вложить перечисления в класс, то есть описать их
//не глобально, а в пределах тела класса (листинг 21.6)


class Chessman_p {
    enum ChessmanType {
        case king, castle, bishop, pawn, knight, queen
    }
    enum ChessmanColor {
        case black, white
    }
    let type: ChessmanType
    let color: ChessmanColor
    var coordinates: (String, Int)? = nil
    let figureSymbol: Character
    init(type: ChessmanType, color: ChessmanColor, figure:
        Character) {
        self.type = type
        self.color = color
        figureSymbol = figure
    }
    init(type: ChessmanType, color: ChessmanColor, figure:
        Character, coordinates: (String, Int)) {
        self.type = type
        self.color = color
        figureSymbol = figure
        setCoordinates(char: coordinates.0, num:coordinates.1)
    }
    func setCoordinates(char c:String, num n: Int) {
        coordinates = (c, n)
    }
    func kill() {
        coordinates = nil
    }
}


//Ссылки на вложенные типы
//В некоторых ситуациях может возникнуть необходимость использовать вложенные типы вне определяющего их контекста. Для этого необходимо указать
//имя родительского типа, после которого должно следовать имя требуемого типа
//данных. В следующем примере (листинг 21.7) мы получаем доступ к одному из
//членов перечисления ChessmanType, объявленного в контексте класса Chessman.
//Листинг 21.7


let linkToEnumValue = Chessman_p.ChessmanType.bishop
