//
//  tuples.swift
//  Swift_learning
//
//  Created by Даниил Асташов on 05.10.2024.
//

import Foundation

func tuples(){
    //Если кортеж объявлен с помощью let, его значения нельзя изменять
    let person_new = ("Daniil", 22)
    print(person_new.0)
    print(person_new.1)
    
    //Если кортеж объявлен с помощью let, его значения нельзя изменять
    //При создании кортежа можно назначить имена каждому элементу:
    let person = (name: "Daniil",age:  22)
    print(person.name)
    print(person.age)
    
    //кортеж может быть изменяемым, если использовать ключевое слово var
    var person1 = (name: "John", age: 28)
    person1.age = 29
    print(person1) // Выведет "(name: "John", age: 29)"

}

func getPerson() -> (String, Int){
    return("DanAst", 19)
}

//кортежи можно сравнивать :

let firstPerson = (name: "Dan", age: 18)
let secondPerson = (name: "Den", age: 22)

//Сравнение кортежей: Кортежи можно сравнивать с помощью операторов сравнения, если их элементы также поддерживают сравнение
func comperhension(fp: (name: String, age: Int), sp:(name: String, age: Int)) -> (Bool, Bool, Bool){
    //let ans = (fp_maj: fp.age > sp.age, sp_maj: fp.age < sp.age,eq: fp.age == sp.age)
    return (fp_maj: fp.age > sp.age, sp_maj: fp.age < sp.age,eq: fp.age == sp.age)
}

//можно записать значения кортежа в переменные
let floatStatus: (Float, String, Bool) = (200.2, "In Work", true)
//floatStatus // (.0 200.2, .1 "In Work", .2 true)
// записываем значения кортежа в переменные
let (statusCode, statusText, statusConnect) = floatStatus
// выводим информацию
//print("Код ответа — \(statusCode)")
//print("Текст ответа — \(statusText)")
//print("Связь с сервером — \(statusConnect)")

/* объявляем две переменные с одновременной
инициализацией им значений */
var (myName1, myAge1) = ("Тролль", 140)
// выводим их значения
//print("Мое имя \(myName), и мне \(myAge) лет")

/* получаем только необходимые
значения кортежа */
let (statusCodeNew, _, _) = floatStatus

/* объявляем кортеж с
указанием имен элементов
в описании типа */
let anotherStatusTuple: (statusCode: Int, statusText: String, statusConnect: Bool)
= (200, "In Work", true)
// выводим значение элемента
//anotherStatusTuple.statusCode // 200

//редактирование кортежа:
var myFirstTuple: (Int, String) = (0, "0")
let mySecondTuple = (100, "Код")
// копируем значение одного кортежа в другой
//myFirstTuple = mySecondTuple
//myFirstTuple // (.0 100, .1 "Код")

//Индексы и имена могут использоваться для изменения значений отдельных элементов кортежа (листинг 3.13).
// объявляем кортеж
var someTuple = (200, true)
// изменяем значение отдельного элемента
//someTuple.0 = 404
//someTuple.1 = false
//someTuple // (.0 404, .1 false)

//Использование в коллекциях: Кортежи могут быть элементами массивов, словарей или других коллекций. Например

let people = [("John", 28), ("Alice", 30), ("Bob", 24)]


//реальный пример использования кортежа:
//в функцию передается массив
func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, average: Double) {
    //Чтобы избежать ошибки, если массив пустой, используется оператор ??, который возвращает значение по умолчанию — 0, если минимального значения нет.
    let min = scores.min() ?? 0
    let max = scores.max() ?? 0
    let sum = scores.reduce(0, +)
    let average = Double(sum) / Double(scores.count)

    return (min, max, average)
}

let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])
//print("Min: \(statistics.min), Max: \(statistics.max), Average: \(statistics.average)")

//ограничения кортежей:
/*Кортежи не являются полноценными структурами данных, как классы или структуры (structs), и их не следует использовать для сложных объектов.
 Кортежи не поддерживают наследование и не могут быть расширены методами, как структуры или классы.*/
