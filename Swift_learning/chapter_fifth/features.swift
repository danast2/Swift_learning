//
//  features.swift
//  Swift_learning
//
//  Created by Даниил Асташов on 23.10.2024.
//

import Foundation


//Свойства — неотъемлемая часть объектных типов. В этой главе мы более подробно
//разберем их возможности.
//22.1. Типы свойств
//Свойства — это параметры, объявленные в пределах объектного типа данных. Они
//позволяют хранить или вычислять значения.
//По типу значения можно выделить два основных вида свойств:
// хранимые свойства могут использоваться в структурах и классах;
// вычисляемые свойства могут использоваться в перечислениях, структурах
//и классах.
//Хранимые свойства
//Хранимое свойство — это константа или переменная, объявленная в объектном
//типе и хранящая определенное значение. Хранимое свойство может:
// получить значение в инициализаторе (метод с именем init);
// получить значение по умолчанию в случае, если при создании экземпляра ему
//не передается никакое значение;
// изменить значение в процессе использования экземпляра.
//Мы уже многократно создавали хранимые свойства ранее, например, при реализации класса Chessman.
//Ленивые хранимые свойства
//Хранимые свойства могут быть «ленивыми». Значение, которое должно храниться
//в ленивом свойстве, не создается до момента первого обращения к нему.


//Рассмотрим пример. Создадим класс, описывающий человека. В нем будут свойства, содержащие информацию об имени и фамилии. Также будет определен
//метод, возвращающий полное имя (имя и фамилию вместе), и ленивое свойство,
//содержащее значение данного метода (листинг 22.1).


class Person {
 var firstName = "Имя"
 var secondName = "Фамилия"
 lazy var wholeName: String = self.generateWholeName()
 init(name: String, secondName: String) {
     ( self.firstName, self.secondName ) = ( name, secondName )
 }
 func generateWholeName() -> String {
     return firstName + " " + secondName
 }
}
var me = Person(name:"Егор", secondName:"Петров")
//me.wholeName


//Экземпляр класса Person упрощенно описывает сущность «человек». В свойстве
//wholeName должно храниться его полное имя, но при создании экземпляра его
//значение не задается. При этом оно не равно nil, оно просто не сгенерировано и не
//записано. Это связано с тем, что свойство является ленивым. Как только происходит обращение к данному свойству, его значение формируется.
//Ленивые свойства позволяют экономить оперативную память и не расходовать
//ее до тех пор, пока не потребуется значение какого-либо свойства.
//ПРИМЕЧАНИЕ Стоит отметить, что в качестве значений для хранимых свойств нельзя
//указывать элементы (свойства и методы) того же объектного типа. Ленивые свойства не имеют
//этого ограничения, так как их значения формируются уже после создания экземпляров.
//Ленивые свойства являются lazy-by-need, то есть вычисляются однажды и больше
//не меняют свое значение. Это продемонстрировано в листинге 22.2.


//Несмотря на то что значение свойства secondName было изменено, значение ленивого свойства wholeName осталось прежним.
//Методы типов данных в некоторой степени тоже являются ленивыми: они вычисляют значение при обращении к ним, но делают это каждый раз. Если внимательно посмотреть на структуру класса Person, то для получения полного имени
//можно было обращаться к методу generateWholeName() вместо ленивого свойства wholeName. Но также можно было пойти и другим путем: создать ленивое хранимое
//свойство функционального типа, содержащее в себе замыкание (листинг 22.3).


class Person_new {
 var firstName = "Имя"
 var secondName = "Фамилия"
 lazy var wholeName: ()->String = { "\(self.firstName) \(self.secondName)" }
 init(name: String, secondName: String) {
     ( self.firstName, self.secondName ) = ( name, secondName )
 }
}


var otherMan = Person(name: "Алексей", secondName:"Олейник")
//otherMan.wholeName() // "Алексей Олейник"
//otherMan.secondName = "Дуров"
//otherMan.wholeName() // "Алексей Дуров"


//Обратите внимание, что так как свойство хранит в себе замыкание, доступ к нему
//необходимо организовать с использованием скобок.
//При этом свойство wholeName, хранящее в себе замыкание, будет возвращать
//актуальное значение каждый раз при обращении к нему. То есть данное ленивое
//хранимое свойство называется lazy-by-name.
//Почему необходимо использовать lazy для свойства wholeName? Обратите внимание, что при получении значения свойства wholeName происходит обращение
//к элементам этого же объектного типа (с помощью ключевого слова self). Такой
//подход доступен только для ленивых хранимых свойств: если убрать lazy, то
//Xcode сообщит об ошибке:
//error: Cannot find 'self' in scope
//В данном случае использование self является обязательным, так как происходит
//захват ссылки на объект (при необходимости об этом вам сообщит сам Xcode).
//Более подробно о захвате ссылок на объекты мы поговорим в главе, посвященной
//управлению памятью в Swift


//вычисляемые свойства

//Также существует иной способ создать параметр, значение которого будет вычисляться при каждом доступе к нему. Для этого можно использовать уже знакомые
//нам по перечислениям вычисляемые свойства. По сути, это те же ленивые хранимые свойства, имеющие функциональный тип, но определяемые в упрощенном
//синтаксисе.
//Вычисляемые свойства фактически не хранят значение, а вычисляют его с помощью замыкающего выражения при каждом обращении к ним.
//346   Глава 22. Свойства
//СИНТАКСИС
//var имяСвойства: ТипДанных { тело_замыкающего_выражения }
//Вычисляемые свойства могут храниться исключительно в переменных (var). После указания
//имени объявляемого свойства и типа возвращаемого замыкающим выражением значения
//без оператора присваивания указывается замыкание, в результате которого должно быть
//сгенерировано возвращаемое свойством значение.
//Для того чтобы свойство возвращало некоторое значение, в теле замыкания должен присутствовать оператор return.
//Сделаем свойство wholeName класса Person вычисляемым (листинг 22.4).


class Person_m {
 var firstName = "Имя"
 var secondName = "Фамилия"
 var wholeName: String { return "\(self.firstName) \(self.secondName)" }
 init(name: String, secondName: String) {
     ( self.firstName, self.secondName ) = ( name, secondName )
 }
}
var otherMan_m = Person_m(name: "Алексей", secondName:"Олейник")
//otherMan.wholeName // "Алексей Олейник"
//otherMan.secondName = "Дуров"
//otherMan.wholeName // "Алексей Дуров"


//контроль значений свойств

//Для любого вычисляемого свойства существует возможность реализовать две
//специальные функции:
// Геттер (get) выполняет некоторый код при попытке получить значение вычисляемого свойства.
// Сеттер (set) выполняет некоторый код при попытке установить значение
//вычисляемому свойству.
//Во всех объявленных ранее вычисляемых свойствах был реализован только геттер,
//поэтому они являлись свойствами «только для чтения», то есть попытка изменения
//вызвала бы ошибку. При этом не требовалось писать какой-либо код, который бы
//указывал на то, что существует некий геттер.
//22.2. Контроль значений свойств   347
//В случае, если вычисляемое свойство должно иметь и геттер и сеттер, необходимо
//использовать специальный синтаксис.


//ТипДанных: Any — тип данных возвращаемого свойством значения.
//возвращаемоеЗначение: ТипДанных — значение, возвращаемое вычисляемым свойством.
//Геттер и сеттер определяются внутри тела вычисляемого свойства. При этом используются
//ключевые слова get и set соответственно, за которыми в фигурных скобках следует тело
//каждой из функций.
//Геттер срабатывает при запросе значения свойства. Для корректной работы он должен возвращать значение с помощью оператора return.
//Сеттер срабатывает при попытке установить новое значение свойству. Поэтому необходимо
//указывать имя параметра, в который будет записано устанавливаемое значение. Данный
//ассоциированный параметр является локальным для тела функции set().
//Если в вычисляемом свойстве отсутствует сеттер, то есть реализуется только геттер, можно
//использовать упрощенный синтаксис записи. В этом случае опускается ключевое слово set
//и указывается только тело замыкающего выражения. Данный формат мы встречали в предыдущих примерах.
//Рассмотрим пример. Необходимо разработать структуру, описывающую сущность «окружность». При этом окружность на плоскости имеет две основные
//характеристики:
// координаты центра;
// радиус.
//Но нам также требуется третья характеристика: длина окружности, а она напрямую
//зависит от радиуса и может быть вычислена по специальной формуле. Необходимо учесть, что в процессе работы с экземпляром и радиус, и длина окружности
//могут изменяться. Но при изменении одной величины также должна измениться
//и другая. То есть оба свойства в любой момент времени должны возвращать корректное значение.
//Для решения данной задачи свойство, описывающее длину окружности, сделаем
//вычисляемым и содержащим геттер и сеттер (листинг 22.5).


struct Circle {
 var coordinates: (x: Int, y: Int)
 var radius: Float
 var perimeter: Float {
     get {
         // высчитаем значение, используя текущее значение радиуса
         return 2.0 * 3.14 * radius
     }
     set(newPerimeter) {
         // изменим текущее значение радиуса
         radius = newPerimeter / (2 * 3.14)
     }
 }
}
var myNewCircle = Circle(coordinates: (0,0), radius: 10)
//myNewCircle.perimeter // выводит 62.8
//myNewCircle.perimeter = 31.4
//myNewCircle.radius // выводит 5


//При запросе значения свойства perimeter происходит выполнение кода в геттере,
//который генерирует возвращаемое значение с учетом значения свойства radius.
//При инициализации значения свойству perimeter срабатывает код из сеттера,
//который вычисляет и устанавливает значение свойства radius.
//Сеттер также позволяет использовать сокращенный синтаксис записи, в котором
//не указывается имя входного параметра. При этом внутри сеттера для доступа
//к устанавливаемому значению необходимо задействовать автоматически объявляемый параметр с именем newValue. Таким образом, структура Circle может
//выглядеть как в листинге 22.6.

struct Circle_n {
 var coordinates: (x: Int, y: Int)
 var radius: Float
 var perimeter: Float {
     get {
         return 2.0 * 3.14 * radius
     }
     set {
         radius = newValue / (2 * 3.14)
     }
 }
}


//Наблюдатели хранимых свойств


//Геттер и сеттер позволяют выполнять код при установке и чтении значения вычисляемого свойства. Другими словами, у вас имеются механизмы контроля значений
//свойств. Наделив такими полезными механизмами вычисляемые свойства, разработчики Swift не могли обойти стороной и хранимые свойства. Специально для
//них были реализованы наблюдатели (observers), также называемые обсерверами.
//22.2. Контроль значений свойств   349
//Наблюдатели — это специальные функции, которые вызываются либо непосредственно перед установкой нового значения хранимого свойства, либо сразу после
//нее.
//Выделяют два вида наблюдателей:
// Наблюдатель willSet вызывается перед установкой нового значения.
// Наблюдатель didSet вызывается после установки нового значения


//var имяСвойства: ТипЗначения {
// willSet (ассоциированныйПараметр) {
// // тело обсервера
// }
// didSet (ассоциированныйПараметр) {
// // тело обсервера
// }
//}
//Наблюдатели объявляются с помощью ключевых слов willSet и didSet, после которых
//в скобках указывается имя входного аргумента. В наблюдатель willSet в данный аргумент
//записывается устанавливаемое значение, в наблюдатель didSet — старое, уже стертое.
//При объявлении наблюдателей можно использовать сокращенный синтаксис, в котором не
//требуется указывать входные аргументы (точно так же, как сокращенный синтаксис сеттера). При этом новое значение в willSet присваивается параметру newValue, а старое
//в didSet — параметру oldValue.
//Рассмотрим применение наблюдателей на примере. В структуру, описывающую
//окружность, добавим функциональность, выводящую при изменении радиуса
//окружности информацию об этом на консоль (листинг 22.7).


struct Circle_b {
 var coordinates: (x: Int, y: Int)
 // var radius: Float
 var radius: Float {
     willSet (newValueOfRadius) {
         print("Вместо значения \(radius) будет установлено значение \(newValueOfRadius)")
     }
     didSet (oldValueOfRadius) {
         print("Значение \(oldValueOfRadius) изменено на \(radius)")
     }
 }
 var perimeter: Float {
     get {
         return 2.0 * 3.14 * radius
     }
     set {
         radius = newValue / (2 * 3.14)
     }
 }
}

var myNewCircle_b = Circle_b(coordinates: (0,0), radius: 10)
//myNewCircle.perimeter // выводит 62.8
//myNewCircle.perimeter = 31.4
//myNewCircle.radius // выводит 5


//22.3. Свойства типа

//Ранее мы рассматривали свойства, которые позволяют каждому отдельному
//экземпляру хранить свой, независимый от других экземпляров набор значений.
//Другими словами, можно сказать, что свойства экземпляра описывают характеристики определенного экземпляра и принадлежат определенному экземпляру.
//Дополнительно к свойствам экземпляров вы можете объявлять свойства, относящиеся непосредственно к типу данных. Значения этих свойств едины для всех
//экземпляров данного типа.
//Свойства типа данных очень полезны в том случае, когда существуют значения,
//которые являются универсальными для всего типа целиком. Они могут быть как
//хранимыми, так и вычисляемыми. При этом если значение хранимого свойства
//типа является переменной и изменяется в одном экземпляре, то измененное значение становится доступно во всех других экземплярах типа.
//ПРИМЕЧАНИЕ Для хранимых свойств типа в обязательном порядке должны быть указаны
//значения по умолчанию. Это связано с тем, что сам по себе тип не имеет инициализатора, который
//бы мог сработать еще во время определения типа и установить требуемые значения для свойств.
//Хранимые свойства типа всегда являются ленивыми, при этом они не нуждаются в использовании ключевого слова lazy.
//Свойства типа могут быть созданы для перечислений, структур и классов


//Свойства типа могут быть созданы для перечислений, структур и классов.
//СИНТАКСИС
//struct SomeStructure {
// static var storedTypeProperty = "Some value"
// static var computedTypeProperty: Int {
// return 1
// }
//}
//enum SomeEnumeration {
// static var storedTypeProperty = "Some value"
// static var computedTypeProperty: Int {
// return 2
// }
//22.3. Свойства типа   351
//}
//class SomeClass {
// static var storedTypeProperty = "Some value"
// static var computedTypeProperty: Int {
// return 3
// }
// class var overrideableComputedTypeProperty: Int {
// return 4
// }
//}
//Свойства типа объявляются с использованием ключевого слова static для перечислений,
//классов и структур. Единственным исключением являются маркируемые словом class вычисляемые свойства класса, которые могут быть переопределены в подклассе. О том, что
//такое подкласс, мы поговорим позже.
//Создадим структуру для демонстрации работы свойств типа (листинг 22.8). Класс
//AudioChannel моделирует аудиоканал, у которого есть два параметра:
// максимально возможная громкость ограничена для всех каналов в целом;
// текущая громкость ограничена максимальной громкостью.


struct AudioChannel {
 static var maxVolume = 5
 var volume: Int {
     didSet {
         if volume > AudioChannel.maxVolume {
             volume = AudioChannel.maxVolume
         }
     }
 }
}
var LeftChannel = AudioChannel(volume: 2)
var RightChannel = AudioChannel(volume: 3)
//RightChannel.volume = 6
//RightChannel.volume // 5
//AudioChannel.maxVolume // 5
//AudioChannel.maxVolume = 10
//AudioChannel.maxVolume // 10
//RightChannel.volume = 8
//RightChannel.volume // 8


