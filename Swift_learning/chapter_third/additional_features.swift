//
//  additional_features.swift
//  Swift_learning
//
//  Created by Даниил Асташов on 21.10.2024.
//

import Foundation

//14.1. Метод map(_:)
//Метод map(_:) позволяет применить переданное в него замыкание для каждого
//элемента коллекции. В результате его выполнения возвращается новая последовательность, тип элементов которой может отличаться от типа исходных элементов
//(рис. 14.1)

let myArr = [2, 4, 5, 7]
var newArr = myArr.map{$0}
//newArray // [2, 4, 5, 7]


//Метод map(_:) принимает замыкание и применяет его к каждому элементу массива myArray. Переданное замыкание {$0} не производит каких-либо действий
//над элементами, поэтому результат, содержащийся в переменной newArray, не
//отличается от исходного.
//ПРИМЕЧАНИЕ В данном примере используется сокращенное имя параметра, а именно $0.
//Данная тема была изучена в главе, посвященной замыканиям. Давайте повторим, каким образом
//функция map(_:) лишилась круглых скобок и приобрела вид map{$0}.
//Метод map(_:) позволяет передать в него замыкание, которое имеет один входной параметр того
//же типа, что и элементы обрабатываемой коллекции, а также один выходной параметр. Если не
//использовать сокращенный синтаксис, то вызов метода будет выглядеть следующим образом:
// let array = [2, 4, 5, 7]
// var newArray = array.map({
// (value: Int) -> Int in
// return value
// })
//Замыкание никак не изменяет входной параметр, просто возвращает его.


//Оптимизируем замыкание:
// сократим код перед ключевым словом in, так как передаваемое замыкание
//имеет всего один входной параметр;
// уберем круглые скобки, так как метод map(_:) имеет один входной параметр;
// уберем оператор return, так как тело замыкания помещается в одно выражение.
//В результате получим следующий код:
// var newArray = array.map{value in value}
//Теперь можно убрать ключевое слово in и заменить value на сокращенное имя $0:
// var newArray = array.map{$0}
//Изменим замыкание так, чтобы map(_:) возводил каждый элемент в квадрат
//(листинг 14.2).


var newArr_new = newArr.map{$0*$0}
//newArr_new // [4, 16, 25, 49]


//Как говорилось ранее, тип значений результирующей последовательности может
//отличаться от типа элементов исходной последовательности. Так, например, в ли-
//14.3. Метод flatMap(_:)   281
//стинге 14.3 количество элементов массивов intArray и boolArray одинаково, но
//тип элементов различается (Int и Bool соответственно).
//Листинг 14.3
let intArray = [1, 2, 3, 4]
let boolArray = intArray.map{$0 > 2}
//boolArray // [false, false, true, true]


//Каждый элемент последовательности сравнивается с двойкой, в результате чего
//возвращается логическое значение.
//Вы можете обрабатывать элементы коллекции с помощью метода map(_:) произвольным образом, к примеру, в листинге 14.4 показан пример создания многомерного массива на основе базового.

let numbers = [1, 2, 3, 4]
let mapped = numbers.map { Array(repeating: $0, count: $0) }
//mapped // [[1], [2, 2], [3, 3, 3], [4, 4, 4, 4]]

//Метод map(_:) позволяет обрабатывать элементы любой коллекции, в том числе
//и словаря. В листинге 14.5 показан пример перевода расстояния, указанного
//в милях, в километры.

let milesToDest = ["Moscow":120.0,"Dubai":50.0,"Paris":70.0]
let kmToDest = milesToDest.map { name, miles in [name:miles * 1.6093] }
//kmToDest // [["Dubai": 80.465], ["Paris": 112.651], ["Moscow": 193.116]]


// Метод mapValues(_:)

//Метод mapValues(_:) позволяет обработать значения каждого элемента словаря,
//при этом ключи элементов останутся в исходном состоянии (листинг 14.6).


let mappedCloseStars = ["Proxima Centauri": 4.24, "Alpha Centauri A": 4.37]
let newCollection = mappedCloseStars.mapValues{ $0+1 }
//newCollection // ["Proxima Centauri": "5.24", "Alpha Centauri A": "5.37]



//Метод flatMap(_:)

//Метод flatMap(_:) отличается от map(_:) тем, что всегда возвращает плоский одномерный массив. Так, пример, приведенный в листинге 14.4, но с использованием
//flatMap(_:), вернет одномерный массив (листинг 14.7).
//Листинг 14.7


let numbersArray = [1, 2, 3, 4]
let flatMapped = numbersArray.flatMap { Array(repeating: $0, count: $0) }


//flatMapped // [1, 2, 2, 3, 3, 3, 4, 4, 4, 4]

//Вся мощь flatMap(_:) проявляется тогда, когда в многомерном массиве требуется
//найти все попадающие под некоторое условие значения (листинг 14.8).

let someArr = [[1, 2, 3, 4, 5], [11, 44, 1, 6], [16, 403, 321, 10]]
let filterSomeArr = someArr.flatMap{$0.filter{ $0 % 2 == 0}}
//filterSomeArr // [2, 4, 44, 6, 16, 10]


//14.4. Метод compactMap(_:)
//Метод compactMap(_:) позволяет произвести те же действия, что и map(_:), разница
//лишь в реакции на ситуацию, когда преобразование не может быть произведено.
//В листинге 14.9 показан пример преобразования массива строковых значений
//в массив значений типа Int.

let stringArray = ["1", "2", "3", "four", "5"]
let intFromStringArray = stringArray.map() { Int($0) }
//intFromStringArray // [1, 2, 3, nil, 5]

//Как видно из значения константы intFromStringArray, при неудачной попытке
//преобразования String в Int в результирующий массив помещается специальное
//ключевое слово nil.
//Если воспользоваться методом compactMap(_:), то все неуспешные преобразования
//будут проигнорированы и исключены из результата (листинг 14.10).
//Листинг 14.10

let arrayWitoutNil = stringArray.compactMap() { Int($0) }
//arrayWitoutNil // [1, 2, 3, 5]


//метод filter(_:)

//Метод filter(_:) используется, когда требуется отфильтровать элементы коллекции по определенному правилу (рис. 14.2).
//В листинге 14.11 показана фильтрация всех целочисленных элементов исходного
//массива, которые делятся на 2 без остатка, то есть всех четных чисел.
//Листинг 14.11


let numArray_new = [1, 4, 10, 15]
let even = numArray_new.filter{ $0 % 2 == 0 }
//even // [4, 10]

//Помимо массивов, можно производить фильтрацию других типов коллекций.
//В листинге 14.12 показана фильтрация элементов словаря starDistanceDict.
//Листинг 14.12

let starDistanceDict_new = ["Wolf 359": 7.78, "Alpha Centauri B": 4.37, "Barnard's Star": 5.96]
let closeStars = starDistanceDict.filter { $0.value < 5.0 }


//ХОЧУ ОТСОРТИРОВАТЬ СЛОВАРЬ ПО ЗНАЧЕНИЮ
let closeStars_new = starDistanceDict_new.sorted { $0.value < $1.value }
let closeStars_new_new = starDistanceDict_new.sorted (by: > )
