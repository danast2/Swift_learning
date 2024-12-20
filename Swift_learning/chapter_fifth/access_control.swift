//
//  access_control.swift
//  Swift_learning
//
//  Created by Даниил Асташов on 23.10.2024.
//

import Foundation


//В процессе разработки программного кода Swift предоставляет вам возможность
//определять уровень доступа (контролировать доступ) к объектным типам и их элементам (свойствам и методам). Благодаря этому вы всегда можете быть уверены,
//что при работе с классом, структурой или перечислением случайно не обратитесь
//к «техническому» элементу, использование которого напрямую может привести
//к нежелательным последствиям.
//Чтобы лучше понять, что же такое «контроль доступа», рассмотрим следующий
//пример. Предположим, что вы разработали класс UserManager, который управляет
//учетными записями пользователей приложения. Данный класс состоит из множества свойств и методов (рис. 25.1).
//При этом некоторые из методов являются «техническими», или, иными словами,
//«внутренними», которые вызываются из других методов данного класса. При этом
//их использование извне может привести к неожиданным и не всегда корректным
//результатам. В таком случае было бы логично запретить к ним доступ напрямую,
//то есть сделать их приватными. А остальные элементы, доступ к которым должен
//быть, сделать публичными (рис. 25.2).

//При таком подходе вы всегда сможете контролировать, какие именно элементы класса будут доступны и на каком уровне. Так, теперь попытка доступа
//к методу saveToStorage не в теле данного объектного типа вызовет ошибку
//(листинг 25.1).
//Листинг 25.1
//let userManager = UserManager()
//userManager.generatePassword() // Ошибка
//При этом у вас все еще остается возможность обращаться к приватным методам
//внутри других методов класса UserManager.
//Для контроля доступа используются специальные модификаторы, которые указываются перед объявлением объектного типа, свойства и метода. Всего в Swift
//доступны пять модификаторов:
//open — открытый
//Наименее ограничивающий уровень доступа. Позволяет использовать элемент
//(объектный тип, свойство или метод) без каких-либо ограничений.
//Данный модификатор применяется исключительно к классам и их элементам:
//• класс, имеющий уровень доступа open, может иметь подклассы внутри
//модуля, где он определен, и в модулях, в которые он импортирован;
//• элементы класса, имеющие уровень доступа open, могут быть переопределены в подклассе в том модуле, где он объявлен, а также в модулях,
//в которые он импортирован.
//public — публичный
//Подобно open, данный модификатор позволяет использовать элемент без ограничений. Однако в случае с классами есть некоторые особенности:
//• класс, имеющий уровень доступа public (или более строгий), может иметь
//подклассы только в том модуле, где был объявлен;
//• элементы класса, имеющие уровень доступа public (или более строгий),
//могут быть переопределены (с помощью оператора override) в подклассе
//только в том модуле, где объявлен сам класс.
//Для структур данный модификатор является наивысшим (наименее ограничивающим), так как структуры не поддерживают наследование, а соответственно,
//и модификатор open.
//internal — внутренний

//Данный модификатор используется в случаях, когда необходимо ограничить
//использование объекта модулем. Таким образом, объект будет доступен во
//Контроль доступа   367
//всех исходных файлах модуля, исключая его использование за пределами
//модуля.
//fileprivate — приватный в пределах файла
//Данный модификатор позволяет использовать объект только в пределах данного исходного файла.
//private — приватный (частный)
//Данный модификатор позволяет использовать объект только в пределах конструкции, в которой он объявлен. Например, объявленное в классе свойство
//или метод не будут доступны извне или в его расширениях.
//По умолчанию все объекты имеют уровень доступа internal. Для того чтобы изменить его, необходимо явно указать требуемый уровень.
//Вернемся к примеру с классом UserManager. В соответствии с указанными выше
//требованиями, синтаксис его объявления мог бы выглядеть так, как показано
//в листинге 25.2.

//open class UserManager {
// 
//    // публичное свойство
// public var currentUser: User
// // публичный метод
// public func loadUser(byLogin login: String) -> User {
// // ...
// }
// // публичный метод
// public func createUser(withLogin login: String) {
// // ...
// }
// // приватный метод
// private func saveToStorage() {
// // ...
// }
// // приватный метод
// private func generatePassword() {
// // ...
// }
//}


//Запомните: если предполагается, что уровень доступа к объекту internal, то можно его не указывать, так как по умолчанию для любого объекта назначен именно
//этот уровень.
//При определении уровня доступа элементов необходимо запомнить следующее
//правило:
//В составе объекта с более строгим уровнем доступа не могут находиться элементы с менее строгим уровнем доступа.


//Рассмотрим три примера, демонстрирующие данное правило.
//1. В составе класса, имеющего уровень доступа public, не могут быть объявлены
//свойства и методы, имеющие уровень доступа open.
//2. Уровень доступа к кортежу определяется наиболее строгим элементом, включенным в кортеж. Так, если вы скомпонуете кортеж из двух разных типов,
//один из которых будет иметь уровень доступа internal, а другой — private,
//то результирующим уровнем доступа всего кортежа будет private, то есть самый строгий.
//3. Подобно кортежу, уровень доступа к функции определяется самым строгим
//уровнем типов аргументов функции и типа возвращаемого значения.
//Рассмотрим пример из листинга 25.3.
//Листинг 25.3


/*func someFunction() -> (SomeInternalClass, SomePrivateClass) {
 // тело функции
}*/

//Можно было ожидать, что уровень доступа функции будет равен internal, так как
//не указан явно. На самом деле эта функция вообще не будет скомпилирована. Это
//связано с тем, что тип возвращаемого значения — это кортеж с уровнем доступа
//private. При этом тип этого кортежа определяется автоматически на основе типов
//данных, входящих в него.
//В связи с тем что уровень доступа функции — private, его необходимо указать
//явно (так как отсутствие модификатора равносильно internal) (листинг 25.4).
//Листинг 25.4

/*private func someFunction() -> (SomeInternalClass, SomePrivateClass) {
 // тело функции
}*/

//Что касается перечислений, стоит обратить внимание на то, что каждый член
//перечисления получает тот же уровень доступа, который установлен для самого
//перечисления.
