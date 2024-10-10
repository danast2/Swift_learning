//
//  set.swift
//  Swift_learning
//
//  Created by Даниил Асташов on 09.10.2024.
//

import Foundation

/*В Swift множества (sets) — это коллекции уникальных значений без определенного порядка. Они могут содержать элементы любого типа, который соответствует протоколу Hashable. Множества удобны для хранения уникальных элементов и выполнения операций, таких как объединение, пересечение и разность*/

let mySet: Set<Int> = [1,5,0]
let mySetNew: Set = [22, 8, 335]
let mySet1 = Set<Int>(arrayLiteral: 3, 6, 8)
let mySet2 = Set(arrayLiteral: 3, 6, 8)

var dishes: Set<String> = ["хлеб", "овощи", "тушенка", "вода"]
var dishesTwo: Set = ["хлеб", "овощи", "тушенка", "вода"]
var members = Set<String>(arrayLiteral: "Энакин", "Оби Ван", "Йода")
var membersTwo = Set(arrayLiteral: "Энакин", "Оби Ван", "Йода")

//пустое множество

// создание пустого множества
let emptySet = Set<String>()
// множество со значениями
var setWithValues: Set<String> = ["хлеб", "овощи"]
// удаление всех элементов множества
//setWithValues = []
//setWithValues // Set([])

//Базовые свойства и методы множеств

// создаем пустое множество
var musicStyleSet: Set<String> = []
// добавляем к нему новый элемент
//musicStyleSet.insert("Jazz") // (inserted true, memberAfterInsert "Jazz")
//musicStyleSet // {"Jazz"}

// создание множества со значениями
//musicStyleSet = ["Jazz", "Hip-Hop", "Rock"]
// удаляем один из элементов
var removeStyleResult = musicStyleSet.remove("Hip-Hop")
//removeStyleResult // "Hip-Hop"
//musicStyleSet // {"Jazz", "Rock"}
// удаляем несуществующий элемент
//musicStyleSet.remove("Classic") // nil
// удаляем все элементы множества
//musicStyleSet.removeAll()
//musicStyleSet // Set([])

/*
musicStyleSet = ["Jazz", "Hip-Hop", "Rock", "Funk"]
// проверка существования значения во множестве
musicStyleSet.contains("Funk") // true
musicStyleSet.contains("Pop") // false
*/


//операции со множествами

// множество с нечетными цифрами
let oddDigits: Set = [1, 3, 5, 7, 9]
// множество с четными цифрами
let evenDigits: Set = [0, 2, 4, 6, 8]
// множество со смешанными цифрами
let differentDigits: Set = [3, 4, 7, 8]

/*/
Во множествах oddDigits, evenDigits и differentDigits существуют как уникальные для каждого из них, так и общие элементы.
Для каждой пары множеств можно произвести следующие операции (рис. 7.2):
 получить все общие элементы (intersection(_:));
 получить все непересекающиеся (не общие) элементы (symmetricDifference(_:));
 получить все элементы обоих множеств (union(_:));
 получить разницу элементов, то есть элементы, которые входят в первое множество, но не входят во второе (subtracting(_:)).
При использовании метода intersection(_:) возвращается множество, содержащее значения, общие для двух множеств (листинг 7.8).
Листинг 7.8
let inter = differentDigits.intersection(oddDigits)
inter // {3, 7}
*/

let exclusive = differentDigits.symmetricDifference(oddDigits)
//exclusive //{4, 8, 1, 5, 9}
//Для получения всех элементов из обоих множеств (их объединения) применяется
//объединяющий метод union(_:), как показано в листинге 7.10.
//Листинг 7.10
let union = evenDigits.union(oddDigits)
//union //{8, 4, 2, 7, 3, 0, 6, 5, 9, 1}
//Метод subtracting(_:) возвращает все элементы первого множества, которые не
//входят во второе (листинг 7.11).
//Листинг 7.11
let subtract = differentDigits.subtracting(evenDigits)
//subtract // {3, 7}


//отношения множеств

let aSet: Set = [1, 2, 3, 4, 5]
let bSet: Set = [1, 3]
let cSet: Set = [5, 6, 7, 8]


/*// создаем копию множества
 let copyOfBSet = bSet
 /* во множествах bSet и copyOfBSet одинаковый состав
  элементов. Проверим их на эквивалентность */
 bSet == copyOfBSet // true
 Метод isSubset(of:) определяет, является ли одно множество подмножеством
 другого, как bSet для aSet. При этом он возвращает true, даже если множества
 равны (листинг 7.14).
 Листинг 7.14
 let aSet: Set = [1, 2, 3, 4, 5]
 let bSet: Set = [1, 3]
 bSet.isSubset(of: aSet) // true
 Метод isSuperset(of:) вычисляет, является ли множество надмножеством для
 другого, как aSet для bSet. При этом он возвращает true, даже если множества
 равны (листинг 7.15).
 Листинг 7.15
 let aSet: Set = [1, 2, 3, 4, 5]
 let bSet: Set = [1, 3]
 aSet.isSuperset(of: bSet) // true*/

/*bSet.isDisjoint(with: cSet) // true
Методы isStrictSubset(of:) и isStrictSuperset(of:) определяют, является множество подмножеством или надмножеством, не равным указанному множеству
(листинг 7.17).
Листинг 7.17
bSet.isStrictSubset(of: aSet) // true
aSet.isStrictSuperset(of: bSet) // true var aSet: Set = [1, 2, 3, 4, 5]
С помощью уже знакомого метода sorted() вы можете отсортировать множество.
При этом будет возвращен массив, в котором все элементы расположены по возрастанию (листинг 7.18).
Листинг 7.18
let setOfNums: Set = [1,10,2,5,12,23]
let sortedArray = setOfNums.sorted()
sortedArray // [1, 2, 5, 10, 12, 23]
type(of: sortedArray) // Array<Int>.Type*/


//здесь показывается, зачем нужен arrayLiteral в принципе в Swift
struct MyCustomType: ExpressibleByArrayLiteral {
    var values: [(String, Int)]

    // Определяем, какие типы будут использоваться при инициализации с литералом массива
    typealias ArrayLiteralElement = (String, Int)
    
    // Инициализатор, который принимает переменное число кортежей
    init(arrayLiteral elements: (String, Int)...) {
        self.values = elements // собираем элементы в массив
    }
}

// Использование
let myCollection: MyCustomType = [("Alice", 25), ("Bob", 30)]

// Вывод значений
/*for (name, age) in myCollection.values {
    print("\(name) is \(age) years old.")
}*/
