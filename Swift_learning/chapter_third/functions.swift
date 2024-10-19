//
//  functions.swift
//  Swift_learning
//
//  Created by Даниил Асташов on 17.10.2024.
//

import Foundation

func myFirstFunc(a: Int, b: String) -> String {
 String(a) + b
}
func printMessage() {
 print("Сообщение принято")
}
// вызываем функцию по ее имени
//printMessage()
//printMessage()


func sumTwoInt(a: Int, b: Int) {
 print("Результат операции - \(a+b)")
}

/*Внешние имена входных параметров
Аргументы a и b функции sumTwoInt(a:b:) используются как при вызове функции,
так и в ее теле (там они называются входными параметрами). Swift позволяет
указать внешние имена параметров, которые будут использоваться при вызове
функции (листинг 12.3).*/
func sumTwoInt(num1 a: Int, num2 b: Int) {
 print("Результат операции - \(a+b)")
}
//sumTwoInt(num1: 10, num2: 12)

//Если внешнее имя заменить на символ нижнего подчеркивания (_), то при вызове
//функции имя параметра вообще не потребуется указывать (листинг 12.4).
//Листинг 12.4
func sumTwoInt(_ a: Int, _ b: Int) {
 print("Результат операции - \(a+b)")
}

//sumTwoInt(10, 12) //22

func sumTwoInt_new(_ a: Int, _ b: Int) -> Int {
 let result = a + b
 print("Результат операции - \(result)")
 return result
}
var result = sumTwoInt_new(10, 12) // 22

/**Изменяемые копии входных параметров
 Все входные параметры функции — константы. При попытке изменения их значения внутри тела функции происходит ошибка. При необходимости изменения
 переданного входного значения внутри функции потребуется создать новую
 переменную и присвоить переданное значение ей (листинг 12.6).*/

func returnMessage(code: Int, message: String) -> String {
 var mutableMessage = message
 mutableMessage += String(code)
 return mutableMessage
}
let myMessage = returnMessage(code: 200, message: "Код сообщения - ")
//Функция returnMessage(code:message:) получает на вход два аргумента: code
//и message. В ее теле создается изменяемая копия message, которая без каких-либо
//ошибок модифицируется, после чего возвращается

/**Сквозные параметры
 Приведенный способ модификации значений параметров позволяет получать доступ
 к изменяемому значению только в пределах тела самой функции. Для того чтобы
 была возможность модификации параметров с сохранением измененных значений
 после окончания работы функции, необходимо использовать сквозные параметры.
 Чтобы преобразовать входной параметр в сквозной, перед описанием его типа необходимо указать модификатор inout. Сквозной параметр передается в функцию,
 изменяется в ней и сохраняет свое значение при завершении работы функции,
 заменяя собой исходное значение. При вызове функции перед передаваемым
 значением аргумента необходимо ставить символ «амперсанд» (&), указывающий
 на то, что параметр передается по ссылке.
 Функция в листинге 12.7 обеспечивает обмен значениями двух внешних параметров.*/

func changeValues(_ a: inout Int, _ b: inout Int) -> Void {
 let tmp = a
 a = b
 b = tmp
}
var x_new = 150, y_new = 45
//changeValues(&x, &y)
//x // 45
//y // 150

//Функция принимает на входе две переменные, a и b. Эти переменные передаются
//в функцию как сквозные параметры, что позволяет изменить их значения внутри
//функции и сохранить эти изменения после завершения ее работы.
//ПРИМЕЧАНИЕ В качестве сквозного параметра может выступать только переменная. Константы или литералы нельзя передавать, так как они являются неизменяемыми.

//функция в качестве входного параметра

/*Вы можете использовать возвращаемое некоторой функцией значение в качестве
 значения входного параметра другой функции. Самое важное, чтобы тип возвращаемого значения функции совпадал с типом входного параметра.
 В листинге 12.8 используется объявленная ранее функция returnMessage
 (code:message:), возвращающая значение типа String.
 Листинг 12.8
 // используем функцию в качестве значения
                                        print( returnMessage(code: 400, message: "Сервер недоступен. Код сообщения - ") )
 Консоль
 Сервер недоступен. Код сообщения - 400
 12.2. Входные параметры и возвращаемое значение   249
 Уже известная нам функция print(_:) принимает на входе строковый литерал
 типа String. Так как функция returnMessage(code:message:) возвращает значение
 этого типа, она может быть указана в качестве входного параметра для print(_:).*/

//Входной параметр с переменным числом значений

/*В некоторых ситуациях необходимо, чтобы функция получала неизвестное заранее число однотипных значений. Мы уже встречались с таким подходом при
использовании Array(arrayLiteral:), когда заранее неизвестно, сколько элементов будет содержать параметр arrayLiteral. Такой тип входного параметра
называется вариативным.
Вариативный параметр обозначается в списке входящих параметров с указанием
оператора диапазона ... сразу после типа. Значения аргумента при вызове функции задаются через запятую.
Рассмотрим пример из листинга 12.9. Представьте, что удаленный сервер на каждый запрос отправляет вам несколько ответов. Каждый ответ — это целое число,
но их количество может быть различным. Вам необходимо написать функцию,
которая принимает на входе все полученные ответы и выводит их на консоль.
Листинг 12.9*/
func printRequestString(codes: Int...) -> Void {
 var codesString = ""
 for oneCode in codes {
 codesString += String(oneCode) + " "
 }
 print("Получены ответы — \(codesString)")
}
/*printRequestString(codes: 600, 800, 301)
printRequestString(codes: 101, 200)
Консоль
Получены ответы — 600 800 301
Получены ответы — 101 200
Параметр codes может содержать произвольное количество значений указанного
типа. Внутри функции он трактуется как последовательность (Sequence), поэтому
его можно обработать с помощью конструкции for-in.
У одной функции может быть только один вариативный параметр, и он должен
находиться в самом конце списка входных параметров*/

//кортеж в качестве возвращаемого значения

/*Функция может возвращать значения любого типа данных. Отдельно отмечу,
 что и кортежи могут быть использованы для этого, так как с их помощью можно
 с легкостью вернуть сразу несколько значений (возможно, именно этого вам не
 хватало в других языках программирования, — лично мне не хватало).
 250   Глава 12. Функции
 Представленная в листинге 12.10 функция принимает на вход код ответа сервера
 и в зависимости от того, к какому диапазону относится переданный код, возвращает кортеж с его описанием*/

func getCodeDescription(code: Int) -> (Int, String) {
 let description: String
 switch code {
 case 1...100:
     description = "Error"
 case 101...200:
     description = "Correct"
 default:
     description = "Unknown"
 }
 return (code, description)
}
//getCodeDescription(code: 150) // (150, "Correct")

/**В качестве типа возвращаемого значения функции getCodeDescription(code:)
 указан тип кортежа, содержащего два значения: код и его описание.
 Функцию getCodeDescription(code:) можно улучшить, если указать не просто тип
 возвращаемого кортежа, а названия его элементов (прямо в типе возвращаемого
 функцией значения) (листинг 12.11).*/


func getCodeDescription_new(code: Int) -> (code: Int, description: String) {
 let description: String
 switch code {
 case 1...100:
     description = "Error"
 case 101...200:
     description = "Correct"
 default:
     description = "Unknown"
 }
 return (code, description)
}
let request_new = getCodeDescription_new(code: 45)
//request.description // "Error"
//request.code // 45

//значения по умолчанию входного параметра
/**Напомню, что все входные параметры должны обязательно иметь значения. Ранее
 для этого мы указывали их при вызове функции. Но существует возможность
 12.3. Функциональный тип   251
 определить значения по умолчанию, которые позволяют не указывать значения
 при вызове.
 Другими словами, если вы передали значение входного параметра, то оно будет использовано в теле функции; если вы не передали значение параметра, для него будет
 использовано значение по умолчанию. Значение по умолчанию указывается при
 объявлении функции в списке входных параметров для каждого параметра отдельно.
 Доработаем объявленную ранее функцию returnMessage(code:message:) таким
 образом, чтобы была возможность не передавать значение параметра message. Для
 этого укажем значение по умолчанию (листинг 12.12)*/

func returnMessage_new(code: Int, message: String = "Код - ") -> String {
 var mutableMessage = message
 mutableMessage += String(code)
 return mutableMessage
}
//returnMessage(code: 300) //"Код - 300"

/**Как вы можете видеть, при вызове returnMessage(code:message:) не передается
 значение для параметра message. Это стало возможным благодаря установке значения по умолчанию "Код - " в списке входных параметров.
 Тело функции returnMessage(code:message:) написано не самым лучшим способом, так как, по сути, оно может состоять лишь из одного выражения, а следовательно, и лишиться оператора return. В листинге 12.13 показан оптимальный
 вариант данной функции.*/

func returnMessage_new_new(code: Int, message: String = "Код - ") -> String {
 message + String(code)
}
//returnMessage(code: 300) // "Код - 300"


//функциональный тип
/*Одно из свойств функции заключается в том, что она может быть записана в параметр и с его помощью передана. Но как такое возможно, если у любого параметра,
 252   Глава 12. Функции
 как мы знаем, должен быть определенный тип данных? Возможно, я вас удивлю,
 но любая функция имеет свой функциональный тип данных, который указывает
 на типы входных и выходного значений.
 Простой функциональный тип
 Если функция ничего не принимает и не возвращает, то ее тип указывается круглой
 скобкой и ключевым словом Void после стрелки:
 () -> Void
 ПРИМЕЧАНИЕ Также возможен вариант с двумя парами круглых скобок, разделенных
 стрелкой () -> (), но он не является хорошей практикой программирования.
 В листинге 12.14 приведен пример функции с типом () -> Void, то есть не имеющей
 ни входных, ни выходных параметров.
 Листинг 12.14
 func printErrorMessage() {
  print("Произошла ошибка")
 }
 В первых скобках функционального типа всегда описываются типы данных входных параметров, а после стрелки указывается тип данных выходного значения
 (если, конечно, оно существует). Если функция принимает на вход массив целочисленных значений, а возвращает опциональное строковое значение, то ее тип
 данных будет выглядеть следующим образом:
 ([Int]) -> String?
 ПРИМЕЧАНИЕ Обратите внимание, что при наличии возвращаемого значения оно указывается вместо круглых скобок, а не в них.
 В левой части функционального типа указываются типы входных параметров,
 в правой — тип выходного значения
*/


//сложный функциональный тип

/*В некоторых случаях выходное значение функции также является функцией,
 которая, в свою очередь, может возвращать значение. В результате этого функциональный тип становится сложным, то есть содержащим несколько указателей
 на возвращаемое значение (несколько стрелок ->).
 В самом простом варианте функция, возвращающая другую функцию, которая
 ничего не возвращает, будет иметь следующий функциональный тип:
 () -> () -> Void
 12.4. Функция в качестве входного и возвращаемого значений   253
 Представим, что некоторая функция принимает на вход значение типа Int и возвращает функцию, которая принимает на вход значение типа String и возвращает
 значение типа Bool. Ее функциональный тип будет выглядеть следующим образом:
 (Int) -> (String) -> Bool
 
 return { input in
     if let number = Int(input) {
         return number > threshold
     } else {
         return false
     }
 }

 
 let validator = makeValidator(threshold: 100)
 let result1 = validator("150")  // true, потому что 150 > 100
 let result2 = validator("50")   // false, потому что 50 <= 100
 let result3 = validator("abc")  // false, потому что "abc" не число
 
 Каждый блок, описывающий типы данных входных параметров, заключается
 в круглые скобки. Таким образом можно определить, где начинается функциональный тип очередной функции.
 Но функция может не только возвращаться другой функцией, но и передаваться
 в качестве входного параметра. Далее приведен пример, в котором функция принимает на вход целое число и другую функцию, а возвращает логическое значение.
 (Int, (Int) -> Void) -> Bool
 
 func processAndCheck(value: Int, action: (Int) -> Void) -> Bool {
     // Выполняем действие, переданное в качестве второго аргумента
     action(value)
     
     // Возвращаем результат проверки: является ли число положительным
     return value > 0
 }

 // Пример использования:
 let result = processAndCheck(value: 10) { number in
     print("Обработка числа: \(number)")
 }

 print(result) // true

 Функция, которая передается в качестве входного параметра, имеет тип (Int) ->
 Void, то есть она сама принимает целочисленное значение, но не возвращает ничего*/
