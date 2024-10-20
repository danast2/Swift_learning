//
//  closure.swift
//  Swift_learning
//
//  Created by Даниил Асташов on 20.10.2024.
//

import Foundation


/**Как объясняется в документации к языку Swift, замыкания (closures) — это
 организованные блоки с определенной функциональностью, которые могут быть
 переданы и использованы в коде.
 Согласитесь, не очень доступное объяснение. Попробуем иначе.
 Замыкания (closure), или замыкающие выражения, — это сгруппированный
 программный код, который может быть передан в виде параметра и многократно
 использован. Ничего не напоминает? Если вы скажете, что в этом определении
 узнали функции, то будете полностью правы. Поговорим об этом подробнее*/

//виды замыканий

/*Как объясняется в документации к языку Swift, замыкания (closures) — это
 организованные блоки с определенной функциональностью, которые могут быть
 переданы и использованы в коде.
 Согласитесь, не очень доступное объяснение. Попробуем иначе.
 Замыкания (closure), или замыкающие выражения, — это сгруппированный
 программный код, который может быть передан в виде параметра и многократно
 использован. Ничего не напоминает? Если вы скажете, что в этом определении
 узнали функции, то будете полностью правы. Поговорим об этом подробнее.
 13.1. Виды замыканий
 Как вы знаете, параметры предназначены для хранения информации, а функции
 могут выполнять определенные задачи. Говоря простым языком, с помощью замыканий вы можете поместить блок исполняемого кода в переменную или константу, свободно передавать ее и при необходимости вызывать хранящийся в ней
 код. Вы уже видели подобный подход при изучении функций, и в этом нет ничего
 странного. Дело в том, что функции — это частный случай замыканий.
 В общем случае замыкание (closure) может принять две формы:
  именованная функция;
  безымянная функция, определенная с помощью облегченного синтаксиса.
 Знакомству с именованными функциями была посвящена вся предыдущая глава.
 Уверен, что вы уже неплохо знакомы с их возможностями. Далее рассмотрим
 безымянные функции как один из способов представления замыканий.
 ПРИМЕЧАНИЕ В дальнейшем безымянные функции будут именоваться замыканиями, или
 замыкающими выражениями. Говоря о функции, мы будем иметь в виду именно функции, а говоря о замыканиях — безымянные функции.*/

//введение в безымянные функции

/*Как вы уже знаете, переменная и константа может хранить в себе ссылку на
 функцию. Но для того, чтобы организовать это, не обязательно возвращать одну
 262   Глава 13. Замыкания (closure)
 функцию из другой. Вы можете использовать специальный облегченный синтаксис, создав безымянную функцию, после чего передать ее в качестве значения
 в требуемый параметр. Безымянные функции не имеют имен. Они состоят только
 из тела, заключенного в фигурные скобки.
 
 { (входные_параметры) -> ТипВозвращаемогоЗначения in
  // тело замыкающего выражения
 }
 */

// безымянная функция в качестве значения константы
let functionInLet = { return true }
// вызываем безымянную функцию
//functionInLet() // true

/**В нашей программе объявлена переменная wallet, хранящая в себе программный
 аналог кошелька с купюрами (в предыдущей главе мы уже использовали подобный массив-кошелек). Каждый элемент этой коллекции представляет собой
 одну банкноту определенного номинала. Перед нами стоит задача отбора банкнот
 в кошельке по различным условиям. Для каждого условия может быть создана
 отдельная функция, принимающая на вход массив wallet и возвращающая отфильтрованную коллекцию.
 В листинге 13.1 показано, каким образом может быть реализована функция отбора
 всех сторублевых купюр.*/

// массив с купюрами
var wallet = [10,50,100,100,5000,100,50,50,500,100]
// функция отбора купюр
func handle100(wallet: [Int]) -> [Int] {
    var returnWallet = [Int]()
    for banknote in wallet {
        if banknote == 100 {
            returnWallet.append(banknote)
        }
    }
    return returnWallet
}
// вызов функции отбора купюр с достоинством 100
//handle100(wallet: wallet) // [100, 100, 100, 100]

/**При каждом вызове функция handle100(wallet:) будет возвращать массив сторублевых купюр переданного массива-кошелька.
 Но условия отбора не ограничиваются данной функцией. Расширим функционал
 нашей программы, написав дополнительную функцию для отбора купюр достоинством 1000 рублей и более (листинг 13.2).*/

func handleMore1000(wallet: [Int]) -> [Int] {
    var returnWallet = [Int]()
    for banknote in wallet {
        if banknote >= 1000 {
            returnWallet.append(banknote)
        }
}
    return returnWallet
}
// вызов функции отбора купюр с достоинством более или равно 1000
//handleMore1000(wallet: wallet) // [5000]

/**В результате для отбора купюр по требуемым условиям реализовано уже две
 функции: handle100(wallet:) и handleMore1000(wallet:). При этом тела обеих
 функций очень похожи (практически дублируют друг друга), разница лишь в проверяемом условии, остальной код в функциях один и тот же. В случае дальнейшего
 расширения программы будут появляться все новые и новые функции, также
 повторяющие один и тот же код.
 Для решения проблемы дублирования можно пойти двумя путями:
  реализовать всю функциональность отбора купюр в пределах одной функции,
 а в качестве аргумента передавать условие;
  реализовать всю функциональность в виде трех функций. Первая будет группировать повторяющийся код и принимать в виде аргумента одну из двух
 других функций. Переданная функция будет производить проверку условия
 в теле главной функции.*/

/**функция будет разрастаться и в конце концов станет нечитабельной и слишком
 264   Глава 13. Замыкания (closure)
 сложной. Плюс к этому необходимо придумать, каким образом передавать указатель на проверяемое условие, а значит, потребуется вести документацию к данной
 функции.
 По этой причине воспользуемся вторым вариантом, реализуем функционал в виде
 трех функций:
  Функция с именем handle, принимающая массив-кошелек и условие отбора
 (в виде имени функции) в качестве аргументов и возвращающая массив отобранных купюр. В теле функции будут поочередно проверяться элементы
 входного массива на соответствие переданному условию.
  Функция с именем compare100, принимающая на вход значение очередного
 элемента массива-кошелька, производящая сравнение с целым числом 100
 и возвращающая логический результат этой проверки.
  Функция с именем compareMore1000, аналогичная compare100, но производящая
 проверку на соответствие целому числу 1000.
 В листинге 13.3 показана реализация описанного алгоритма*/

// единая функция формирования результирующего массива
func handle(wallet: [Int], closure: (Int) -> Bool) -> [Int] {
 var returnWallet = [Int]()
 for banknote in wallet {
     if closure(banknote) {
         returnWallet.append(banknote)
     }
}
 return returnWallet
}
// функция сравнения с числом 100
func compare100(banknote: Int) -> Bool {
    return banknote == 100
}
// функция сравнения с числом 1000
func compareMore1000(banknote:Int) -> Bool {
    return banknote >= 1000
}
// отбор
let resultWalletOne = handle(wallet: wallet, closure: compare100)
let resultWalletTwo = handle(wallet: wallet, closure: compareMore1000)

/**Функция handle(wallet:closure:) получает в качестве входного параметра
 closure одну из функций проверки условия и в операторе if вызывает переданную функцию. Функции проверки принимают на вход анализируемую купюру и возвращают Bool в зависимости от результата сравнения. Чтобы получить купюры определенного достоинства, необходимо вызвать функцию
 handle(wallet:closure:) и передать в нее имя одной из функций проверки.
 В итоге мы получили очень качественный и легкочитаемый код.
 13.3. Возможности замыканий   265
 Представим, что возникла необходимость написать функции для отбора купюр по
 многим и многим условиям (найти все полтинники; все купюры достоинством менее 1000 рублей; все купюры, которые без остатка делятся на 200, и т. д.). Условий
 отбора может быть великое множество. В определенный момент писать отдельную
 функцию проверки для каждого из них станет довольно тяжелой задачей, так как
 для того, чтобы использовать единую функцию проверки, необходимо знать имя
 проверяющей функции, а их могут быть десятки.
 В подобной ситуации можно отказаться от создания отдельных функций и передавать в handle(wallet:closure:) условие отбора в виде безымянной функции.
 В листинге 13.4 показано, каким образом это может быть реализовано.*/

// отбор купюр достоинством выше 1000 рублей
// аналог передачи compareMore1000


/*handle(wallet: wallet, closure: { (banknote: Int) -> Bool in
 return banknote >= 1000
})*/


// отбор купюр достоинством 100 рублей
// аналог передачи compare100


/*handle(wallet: wallet, closure: { (banknote: Int) -> Bool in
 return banknote == 100
})*/

/*Входной параметр closure имеет функциональный тип (Int)->Bool, а значит,
 передаваемая безымянная функция должна иметь тот же тип данных, что мы
 видим в коде.
 Для переданного замыкания указан входной параметр типа Int и определен тип
 возвращаемого значения (Bool). После ключевого слова in следует тело функции,
 в котором с помощью оператора return возвращается логическое значение — результат проверки очередного элемента кошелька. Таким образом, в теле функции
 handle(wallet:closure:) будет вызываться не какая-то внешняя функция, имя
 которой передано, а безымянная функция, переданная в виде входного параметра.
 В результате такого подхода необходимость в существовании функций
 compare100(banknote:) и compareMore1000(banknote:) отпадает, так как код условия передается напрямую в качестве замыкания в аргумент closure.
 ПРИМЕЧАНИЕ Далее в качестве примера будет производиться работа только с функцией
 отбора купюр достоинством 1000 рублей и больше.*/

//возможности замыканий

/**Замыкающие выражения позволяют в значительной мере упрощать ваши программы. Это лишь одна из многих возможностей Swift, обеспечивающих красивый
 и понятный исходный код проектов. Приступим к оптимизации замыкающих
 
 выражений из примера выше и параллельно рассмотрим возможности, которые
 доступны нам при их использовании.
 Пропуск указания типов
 При объявлении входного параметра closure в функции handle(wallet:closure:)
 указывается его функциональный тип (Int)->Bool, поэтому при передаче замыкающего выражения можно опустить данную информацию, оставив лишь имя
 аргумента (листинг 13.5).
 Листинг 13.5
 
 
 // отбор купюр достоинством выше 1000 рублей
 handle(wallet: wallet, closure: { banknote in
  return banknote >= 1000
 })


 В замыкающем выражении перед ключевым словом in необходимо указать только
 имя параметра без входных и выходных типов.
 
 Неявное возвращение значения
 Если тело замыкающего выражения содержит всего одно выражение, которое
 возвращает некоторое значение (с использованием оператора return), то такие
 замыкания могут неявно возвращать выходное значение. «Неявно» — значит, без
 использования оператора return (листинг 13.6).
 Листинг 13.6
 
 
 handle(wallet: wallet, closure: { banknote in banknote >= 1000})


 Сокращенные имена параметров
 В случае, когда замыкание состоит из одного выражения, можно опустить указание
 входных параметров (все до ключевого слова in, включая само слово). При этом
 доступ к входным параметрам внутри тела замыкания необходимо осуществлять
 через сокращенные имена в форме $номер_параметра. Номера входных параметров
 начинаются с нуля.
 ПРИМЕЧАНИЕ В сокращенной форме записи имен входных параметров обозначение $0
 указывает на первый передаваемый аргумент. Для доступа ко второму аргументу необходимо
 использовать обозначение $1, к третьему — $2 и т. д.
 Перепишем вызов функции handle(wallet:closure:) с использованием сокращенных имен (листинг 13.7).

 Листинг 13.7


 handle(wallet: wallet,
  closure: {$0>=1000})


 Здесь $0 — это входной параметр banknote аргумента closure в функции
 handle(wallet:closure:).
 
 Вынос замыкания за скобки
 Если входной параметр функции расположен последним в списке входных параметров функции (как в данном случае в функции handle(wallet:closure:), где
 параметр closure является последним), Swift позволяет вынести его значение
 (тело замыкающего выражения) за круглые скобки (листинг 13.8).
 Листинг 13.8
 handle(wallet: wallet){ $0 >= 1000 }
 Эта возможность особенно полезна, когда замыкание, передаваемое в качестве
 аргумента функции, является многострочным. В листинге 13.9 показан пример
 выноса замыкания, состоящего из нескольких выражений. С его помощью производится сравнение элементов с массивом «разрешенных» купюр. В результирующей коллекции будут находиться только те купюры, которые являются
 «разрешенными».
 Листинг 13.9

 
handle(wallet: wallet) { banknote in
    for number in Array(arrayLiteral: 100,500) {
        if number == banknote {
            return true
        }
}
    return false
}

 ПРИМЕЧАНИЕ Существует и другой способ реализовать проверку из предыдущего листинга.
 Для этого можно использовать метод contains(_:), передавая в него очередную купюру:
 let successBanknotes = handle(wallet: wallet) { [100,500].contains($0) }
 successBanknotes // [100, 100, 100, 500, 100]*/


//вынос несокольких замыканий за скобки

/*Начиная с версии 5.3, в Swift появилась возможность вынести за скобки не одно,
а все замыкания, находящиеся в конце списка аргументов. Предположим, что вы
написали функцию, осуществляющую запрос на сервер (листинг 13.10).
268   Глава 13. Замыкания (closure)
Листинг 13.10*/


func networkQuery(url: String, success: (String) -> (), error: (Int) -> ()) {
 // код запроса на сервер
}

/*В качестве аргументов в функцию передаются URL-адрес и два замыкания: первое
будет вызвано в случае успешного окончания запроса, а второе — в случае ошибки. При вызове функции networkQuery вы можете использовать как стандартный
синтаксис, указывая замыкания прямо в списке аргументов, так и упрощенный,
вынеся оба замыкания за скобки (листинг 13.11).
Листинг 13.11*/


/*// классический вариант
networkQuery(url: "https://weather.com", success: { data in }, error:
                    {errorCode in })

 
// новый вариант
 
networkQuery(url: "https://weather.com") { data in
 // ...
} error: { errorCode in
 // ...
}

 Данная возможность будет использоваться вами очень часто при работе с фреймворком SwiftUI.
*/


//безымянные функции в параметрах

/*В листинге 13.12 показан пример инициализации замыкания в параметр closure.
При этом у параметра явно указан функциональный тип (ранее в примерах он
определялся неявно).
Листинг 13.12*/


let closure: () -> Void = {
 print("Замыкающее выражение")
}
//closure()
/*Консоль
Замыкающее выражение
Так как данное замыкающее выражение не имеет входных параметров и возвращаемого значения, то его тип равен () -> Void. Для вызова, записанного в константу
замыкающего выражения, необходимо написать имя константы с круглыми скобками, точно так же, как мы делали это ранее.
Явное указание функционального типа позволяет определить входные параметры
и тип выходного значения (листинг 13.13).
13.5. Пример использования замыканий при сортировке массива   269
*///Листинг 13.13


// передача в функцию строкового значения


let closurePrint: (String) -> Void = { text in
 print(text)
}
//closurePrint("Text")
//Консоль
//Text
// передача в функцию целочисленных значений
// с осуществлением доступа через краткий синтаксис $0 и $1


var sum: (_ numOne: Int, _ numTwo: Int) -> Int = {
 $0 + $1
}
//sum(10, 34) // 44


/*ПРИМЕЧАНИЕ Ключевое слово return не используется в замыкании sum, так как его тело
состоит из одного выражения.
Входные параметры замыкания не должны иметь внешних имен. По этой причине
в первом случае указание имени вообще отсутствует, а во втором используется
знак нижнего подчеркивания.
*/


//13.5. Пример использования замыканий при сортировке массива

/**Swift предлагает большое количество функций и методов, позволяющих значительно упростить разработку приложений. Одним из таких методов является
 sorted(by:), предназначенный для сортировки массивов, как строковых, так
 и числовых. Он принимает на входе массив, который необходимо отсортировать,
 и условие сортировки.
 Принимаемое условие сортировки — это обыкновенное замыкающее выражение,
 которое вызывается внутри метода sorted(by:), принимает на входе два очередных элемента сортируемого массива и возвращает значение Bool в зависимости
 от результата их сравнения.
 В листинге 13.14 массив array сортируется таким образом, чтобы элементы были
 расположены по возрастанию. Для этого вметод sorted(by:) передается замыкающее
 выражение, которое возвращает true, когда второе из сравниваемых чисел больше.*/

let array = [1, 44, 81, 4, 277, 50,101,51,8]
var sortedArray = array.sorted(by: { (first: Int, second: Int) -> Bool in
 return first < second
})
//sortedArray // [1, 4, 8, 44, 50, 51, 81, 101, 277]

/*Теперь применим все рассмотренные ранее способы оптимизации замыкающих
 выражений:
  уберем функциональный тип замыкания;
  уберем оператор return;
  заменим имена переменных именами сокращенной формой.
 В результате получится выражение, приведенное в листинге 13.15. Как и в предыдущем примере, здесь тоже необходимо отсортировать массив array таким
 образом, чтобы элементы были расположены по возрастанию. Для этого в метод
 sorted(by:) передается такое замыкающее выражение, которое возвращает true,
 когда второе из сравниваемых чисел больше.*/

var sortedArray_new = array.sorted(by: { $0 < $1 })
//sortedArray // [1, 4, 8, 44, 50, 51, 81, 101, 277]


/**В результате код получается более читабельным и красивым.
 Но и это еще не все. Так как выражение в замыкании состоит всего из одного
 бинарного оператора, то можно убрать даже имена параметров, оставив лишь
 оператор сравнения (листинг 13.16).*/

var sortedArray_new_new = array.sorted(by: <)
//sortedArray // [1, 4, 8, 44, 50, 51, 81, 101, 277]


//Захват переменных

/**Swift позволяет зафиксировать значения внешних по отношению к замыканию
 параметров, которые они имели на момент его определения.
 
 
 
 Синтаксис захвата переменных
 Обратимся к примеру в листинге 13.17. Существуют два параметра, a и b, которые
 не передаются в качестве аргументов в замыкание, но используются им в вычислениях. При каждом вызове такого замыкания оно будет определять значения данных параметров, прежде чем приступить к выполнению операции с их участием.
 
 */

var c = 1
var v = 2
let closureSum : () -> Int = {
 c + v
}
//13.6. Захват переменных   271
//closureSum() // 3
//c = 3
//v = 4
//closureSum() // 7


/**Замыкание, хранящееся в константе closureSum, складывает значения переменных
 a и b. При изменении их значений возвращаемое замыканием значение меняется.
 Существует способ «захватить» значения параметров, то есть зафиксировать те
 значения, которые имеют эти параметры на момент объявления замыкающего
 выражения. Для этого в начале замыкания в квадратных скобках необходимо
 перечислить захватываемые переменные, разделив их запятой, после чего указать
 ключевое слово in.
 Перепишем инициализированное переменной closureSum замыкание таким
 образом, чтобы оно захватывало первоначальные значения переменных a и b
 (листинг 13.18).*/


var c_new = 1
var v_new = 2
let closureSum_new : () -> Int = { [c_new, v_new] in
 c_new + v_new
}
//closureSum_new() // 3
 //c_new = 3
 //v_new = 4
//closureSum_new() // 3


//Замыкание, хранящееся в константе closureSum, складывает значения переменных a и b. При изменении этих значений возвращаемое замыканием значение не
//меняется.


//Захват вложенной функцией
//Другим способом захвата значения внешнего параметра является вложенная функция, написанная в теле другой функции. Вложенная функция может захватывать
//произвольные переменные, константы и даже входные параметры родительской
//функции.
//Рассмотрим пример из листинга 13.19.

func makeIncrement(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func increment() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return increment
}

//Функция makeIncrement(forIncrement:) возвращает значение с функциональным
//типом () -> Int. Это значит, что вернется замыкание, не имеющее входных параметров и возвращающее целочисленное значение.
//Функция makeIncrement(forIncrement:) использует два параметра:
// runningTotal — переменную типа Int, объявленную в теле функции. Именно
//ее значение является результатом работы всей конструкции;
// amount — входной параметр, имеющий тип Int. Он определяет, насколько увеличится значение runningTotal при очередном обращении.
//Вложенная функция increment() не имеет входных или объявляемых параметров,
//но при этом обращается к runningTotal и amount внутри своей реализации. Она
//делает это в автоматическом режиме путем захвата значений обоих параметров по
//ссылке. Захват значений по ссылке гарантирует, что измененные значения параметров не исчезнут после окончания работы функции makeIncrement(forIncrement:)
//и будут доступны при повторном вызове функции increment().
//Теперь обратимся к листингу 13.20.


var incrementByTen = makeIncrement(forIncrement: 10)
var incrementBySeven = makeIncrement(forIncrement: 7)
//incrementByTen() // 10
//incrementByTen() // 20
//incrementByTen() // 30
//incrementBySeven() // 7
//incrementBySeven() // 14
//incrementBySeven() // 21


//В переменных incrementByTen и incrementBySeven хранятся возвращаемые
//функцией makeIncrement(forIncrement:) замыкания. В первом случае значение
//runningTotal увеличивается на 10, а во втором — на 7. Каждая из переменных
//хранит свою копию захваченного значения runningTotal, именно поэтому при
//их использовании увеличиваемые значения не пересекаются и увеличиваются
//независимо друг от друга.
//ВНИМАНИЕ Так как в переменных incrementByTen и incrementBySeven хранятся замыкания, то при доступе к ним после их имени необходимо использовать скобки (по аналогии
//с доступом к функциям).



//13.7. Замыкания передаются по ссылке
//Функциональный тип данных — это ссылочный тип (reference type). Это значит,
//что замыкания передаются не копированием, а с помощью ссылки на область
//памяти, где хранится это замыкание.
//Рассмотрим пример, описанный в листинге 13.21.


var incrementByFive = makeIncrement(forIncrement: 5)
var copyIncrementByFive = incrementByFive

//В данном примере используется функция makeIncrement(forIncrement:), объявленная ранее. Напомню, она возвращает замыкание типа ()->Int, которое в данном
//случае предназначено для увеличения значения на 5. Возвращаемое замыкание
//записывается в переменную incrementByFive, после чего копируется в переменную
//copyIncrementByFive. В результате можно обратиться к одному и тому же замыканию, используя как copyIncrementByFive, так и incrementByFive (листинг 13.22)

//incrementByFive() // 5
//copyIncrementByFive() // 10
//incrementByFive() // 15

/**
 Как видите, какую бы функцию мы ни использовали, происходит модификация
 одного и того же значения (каждое последующее значение больше предыдущего
 на 5). Это обусловлено тем, что замыкания передаются по ссылке.
 */


//автозамыкания

//Автозамыкания — это замыкания, которые автоматически создаются из переданного выражения. Иными словами, может существовать функция, имеющая один
//или несколько входных параметров, которые при ее вызове передаются как значения, но во внутренней реализации функции используются как самостоятельные
//замыкания. Рассмотрим пример из листинга 13.23


var arrayOfNames = ["Helga", "Bazil", "Alex"]
func printName(nextName: String ) {
    print(nextName)
}
//printName(nextName: arrayOfNames.remove(at: 0))

//При вызове функции printName(nextName:) в качестве входного значения ей передается результат вызова метода remove(at:) массива arrayOfNames.
//Независимо от того, в какой части функции будет использоваться переданный
//параметр (или не будет использоваться вовсе), значение, возвращаемое методом
//remove(at:), будет вычислено в момент вызова функции printName(nextName:).
//Получается, что передаваемое значение вычисляется независимо от того, нужно
//ли оно в ходе выполнения функции.
//Отличным решением данной проблемы станет использование ленивых вычислений, то есть таких вычислений, которые будут выполняться лишь в тот момент,
//когда это понадобится. Для того чтобы реализовать этот подход, можно передавать
//в функцию printName(nextName:) замыкание, которое будет вычисляться в тот
//момент, когда к нему обратятся (листинг 13.24).

func printName_new(nextName_new: () -> String) {
 // какой-либо код
 print(nextName_new())
}
//printName_new(nextName: { arrayOfNames.remove(at: 0) })

//Для решения этой задачи потребовалось изменить тип входного параметра
//nextName на ()->String и заключить передаваемый метод remove(at:) в фигурные
//скобки. Теперь внутри реализации функции printName(nextName:) к входному
//параметру nextName необходимо обращаться как к самостоятельной функции (с использованием круглых скобок после имени параметра). Таким образом, значение
//метода remove(at:) будет вычислено именно в тот момент, когда оно понадобится,
//а не в тот момент, когда оно будет передано. Единственным недостатком данного
//подхода является то, что входной параметр должен быть заключен в фигурные
//скобки, а это несколько усложняет использование функции и чтение кода.
//С помощью автозамыканий можно использовать положительные стороны обоих
//рассмотренных примеров: отложить вычисление переданного значения и передавать значение в виде значения (без фигурных скобок).
//Для того чтобы реализовать автозамыкание, требуется, чтобы выполнялись следующие требования:
// Входной параметр должен иметь функциональный тип.
//В примере, приведенном ранее, параметр nextName уже имеет функциональный
//тип () -> String.
// Функциональный тип не должен определять типы входных параметров.
//В примере типы входных параметров не определены (пустые скобки).
// Функциональный тип должен определять тип возвращаемого значения.
//В примере тип возвращаемого значения определен как String.
// Переданное выражение должно возвращать значение того же типа, которое
//определено в функциональном типе замыкания.
//В примере передаваемая в качестве аргумента функция возвращает значение
//типа String точно так же, как определено функциональным типом входного
//параметра.
// Перед функциональным типом необходимо использовать атрибут @autoclosure.
// Передаваемое значение должно указываться без фигурных скобок.
//Перепишем код из предыдущего листинга в соответствии с указанными требованиями (листинг 13.25).


func printName_new_new(nextName_new_new: @autoclosure ()->String) {
    print(nextName_new_new())
}
//printName_new_new(nextName_new_new: arrayOfNames.remove(at: 0))


//Теперь метод remove(at:) передается в функцию printName(nextName:) как обычный аргумент, без использования фигурных скобок, но внутри тела используется
//как самостоятельная функция.
//Ярким примером глобальной функции, входящей в стандартные возможности Swift и использующей механизм автозамыканий, является функция
//assert(condition:message:). Входные параметры condition и message — это
//автозамыкания, первое из которых вычисляется только в случае активного debugрежима, а второе — только в случае, когда condition соответствует false.
//ПРИМЕЧАНИЕ Это еще одна встреча с так называемыми ленивыми вычислениями, о которых
//мы начали говорить в предыдущей главе.
