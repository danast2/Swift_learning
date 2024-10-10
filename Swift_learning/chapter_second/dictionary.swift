//
//  dictionary.swift
//  Swift_learning
//
//  Created by Даниил Асташов on 10.10.2024.
//

import Foundation

/*Словарь — это неупорядоченная коллекция элементов, для доступа к значениям
 которых используются специальные индексы, называемые ключами. Каждый
 элемент словаря состоит из уникального ключа, указывающего на данный элемент, и значения. В качестве ключа выступает не автоматически генерируемый
 целочисленный индекс (как в массивах), а уникальное для словаря значение произвольного типа, определяемое программистом. Чаще всего в качестве ключей используются строковые или целочисленные значения. Все ключи словаря должны
 быть единого типа данных. То же относится и к значениям*/


/*Уникальные ключи словарей не обязаны иметь тип String или Int. Чтобы
 какой-либо тип данных мог использоваться для ключей словаря, он должен быть хешируемым,
 то есть выполнять требования протокола Hashable (о нем мы говорили в одном из примечаний
 предыдущей главы).*/

//Пример создания словаря приведен в листинге 8.1.

let dictionary = ["one":"один", "two": "два", "three":"три"]
//dictionary // ["one": "один", "two": "два", "three": "три"]

//Dictionary(dictionaryLiteral: (100, "Сто"), (200, "Двести"), (300, "Триста"))


//Создание словаря с помощью Dictionary(uniqueKeysWithValues:)

// базовая коллекция кортежей (пар значений)
let baseCollection = [(2, 5), (3, 6), (1, 4)]
// создание словаря на основе базовой коллекции
let newDictionary = Dictionary(uniqueKeysWithValues: baseCollection)
//newDictionary // [3: 6, 2: 5, 1: 4]
/*В функции Dictionary(uniqueKeysWithValues:) используется входной параметр
 uniqueKeysWithValues, которому передается коллекция пар значений. Результирующий словарь содержит в качестве ключей первый элемент каждой пары
 значений (каждого кортежа) базовой коллекции, а в качестве значений — второй
 элемент каждой пары значений.
 
 Вся полезность данного способа проявляется тогда, когда вам необходимо сформировать словарь на основе двух произвольных последовательностей. В этом случае
 вы можете сформировать из них одну последовательность пар «ключ — значение»
 с помощью функции zip(_:_:) и передать ее в функцию Dictionary(uniqueKeys
 WithValues:) (листинг 8.3).*/

let nearestStarNames = ["Proxima Centauri", "Alpha Centauri A",
"Alpha Centauri B"]
// массив расстояний до звезд
let nearestStarDistances = [4.24, 4.37, 4.37]
// получение словаря, содержащего пары значений
let starDistanceDict = Dictionary(uniqueKeysWithValues: zip(nearestStarNames,
 nearestStarDistances))
//starDistanceDict // ["Proxima Centauri": 4.24, "Alpha Centauri B": 4.37,
 //"Alpha Centauri A": 4.37]


//Тип данных словаря
// Словарь с типом данных [Int:String]
let codeDesc = [200: "success", 300: "warning", 400: "error"]
//type(of: codeDesc) // Dictionary<Int, String>.Type

let dictOne: Dictionary<Int,Bool> = [100: false, 200: true, 400: true]
let dictTwo: [String:String] = ["Jonh":"Dave", "Eleonor":"Green"]

///Взаимодействие с элементами словаря
var countryDict = ["RUS": "Россия", "BEL": "Белоруссия", "UKR": "Украина"]
// получаем значение элемента
var countryName = countryDict["BEL"]
//countryName // "Белоруссия"
// изменяем значение элемента
//countryDict["RUS"] = "Российская Федерация"
//countryDict // ["RUS": "Российская Федерация", "BEL": "Белоруссия",
 //"UKR": "Украина"]

var oldValueOne = countryDict.updateValue("Республика Беларусь", forKey: "BEL")
// в переменной записано старое измененное значение элемента
//oldValueOne // "Белоруссия"
var oldValueTwo = countryDict.updateValue("Эстония", forKey: "EST")
// в переменной записан nil, так как элемента с таким ключом не существует
//oldValueTwo // nil

//countryDict["TUR"] = "Турция"
//countryDict // ["BEL": "Республика Беларусь", "TUR": "Турция", "UKR": "Украина",
 // "EST": "Эстония", "RUS": "Российская Федерация"]


//countryDict["TUR"] = nil
//countryDict.removeValue(forKey: "BEL")
//countryDict // ["RUS": "Российская Федерация", "UKR": "Украина", "EST": "Эстония"]
