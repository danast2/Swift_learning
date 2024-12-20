//
//  protocol_oriented_programming.swift
//  Swift_learning
//
//  Created by Даниил Асташов on 25.10.2024.
//

import Foundation


//Глава 32. Протоколориентированное
//программирование
//В этой главе я бы хотел поговорить о методологии разработки приложений
//«Протокол-ориентированное программирование» (ПОП), а также рассмотреть
//несколько сопутствующих вопросов. Глава станет для вас введением в ПОП. По
//мере того как вы будете накапливать опыт разработки, вы сможете самостоятельно
//вернуться к темам, рассмотренным в данной главе, и взглянуть на них уже под
//другим углом.
//32.1. Важность использования протоколов
//Протокол (или интерфейс) — это понятие, которое относится не только к области программирования. Вы могли встречать протоколы (интерфейсы) повсюду,
//начиная от работы в Сети (сетевые протоколы — HTTP, FTP, SSL и т. д.) до повседневной жизни. Так, например, электрическая розетка — это также определенный интерфейс, с которым у вас есть возможность взаимодействовать только
//определенным образом (вставить вилку в розетку). И если в вилке расстояние
//между контактами будет больше или количество контактов будет другое, то
//взаимодействия не произойдет. Таких примеров множество: пульт от телевизора,
//духовка, кухонный нож — каждый из них имеет свой интерфейс, или стандарт,
//через который вы взаимодействуете с данным объектом. И стоит отойти от правил,
//требуемый результат не будет достигнут. Другой пример: вы нажимаете на кнопку
//включения PS5, и вам неважно, как именно эта команда будет отработана, важен
//лишь результат — консоль перешла в активный режим.
//Интерфейс — это стандарт, описывающий порядок взаимодействия с объектом.
//Иными словами, это набор требований, которым должен удовлетворять объект,
//чтобы с ним можно было производить взаимодействие установленным образом.
//ПРИМЕЧАНИЕ Зачастую хакеры занимаются поиском уязвимостей в протоколах, то есть
//стараются найти способы взаимодействия, не предусмотренные стандартом. Так, если вместо
//вилки вы вставите в розетку пальцы, то в некотором роде можете почувствовать себя хакером,
//так как используете интерфейс не по назначению.


//На всякий случай уточню: это была шутка, не стоит искать уязвимости подобного рода, особенно
//в физических интерфейсах.
//Протокол (protocol) в Swift подобен интерфейсу в реальной жизни: с его помощью вы можете определить, какие элементы доступны вам при взаимодействии
//с тем или иным объектом, не вдаваясь в конкретную реализацию. К примеру, вы
//работаете с объектом типа Car, подписанным на протокол Drive, в котором есть
//требования реализации метода driveForward(withSpeed:), а значит, данный метод
//доступен и в самом объекте.
//Есть три важнейшие причины использования протоколов. В протоколах обеспечивается:
//1) целостность типов данных;
//2) инкапсуляция;
//3) полиморфизм.
//Целостность типов данных
//Использование протоколов обеспечивает целостность типов данных. Другими
//словами, если некоторый объектный тип подписан на протокол, то с уверенностью
//можно утверждать, что в нем реализованы требования данного протокола.
//Сам по себе тип не обязан иметь какую-либо функциональность, но протокол,
//в свою очередь, обязывает его. И если в протоколе есть требование реализовать
//конкретное свойство или метод, то оно однозначно будет доступно при работе
//с типом. Например, если тип реализует требования протокола Hashable, то вы
//сможете получить конкретное уникальное целочисленное значение при доступе
//к свойству hashValue, так как в протоколе есть соответствующее требование.
//Инкапсуляция
//Инкапсуляция — это подход, при котором данные и методы для работы с этими
//данными объединяются в единую сущность, при этом скрывая свою внутреннюю
//реализацию.
//Рассмотрим пример. Сущность «Телевизор» в реальном мире объединяет данные
//(телевизионных программ) и методы (переключение программ, изменение громкости и т. д.). При этом вы совсем ничего не знаете, как все это функционирует,
//вы лишь используете интерфейс телевизора (нажимаете кнопки на пульте) и получаете результат. Таким образом, можно сказать, что в данном объекте инкапсулируются данные и методы.
//В листинге 32.1 приведен пример того, как бы мог выглядеть телевизор в виде
//программного кода.


// сущность ТВ-шоу
class TVShow {
 // ...
}
// протокол, описывающий функциональность работы с ТВ-шоу
protocol DisplayShow {
 func getShowsList() -> [TVShow]
 func changeShowTo(show: TVShow) -> Void
 var currentShow: TVShow { get }
 // дополнительные требования ...
}
// протокол, описывающий функциональность управления звуком
protocol ChangeVolume {
 var currentVolume: UInt8 { get set }
 func increase(by: UInt8) -> Void
 func decrease(by: UInt8) -> Void
 // дополнительные требования...
}
// сущность Телевизор принимает протоколы к исполнению
//struct TV: DisplayShow, ChangeVolume {
// // реализация методов и свойств протоколов ...
//}


//Если бы структура TV не принимала протокол ChangeVolume, то у нас не было бы
//гарантии, что она реализует управление громкостью. Если бы структура TV не
//принимала протокол DisplayShow, то у нас не было бы гарантии, что она реализует
//показ телевизионных передач.
//Таким образом, если всегда начинать разработку класса или структуры с протоколов, то сначала вы определяетесь с тем, что должны делать ваши программные
//сущности, а уже потом создаете их реализацию.


//Полиморфизм
//Полиморфизм — это подход, предусматривающий возможность взаимодействия
//с различными типами данных единым образом в отсутствие информации о конкретном типе данных объекта.
//Например, мы могли бы разработать структуру, описывающую DVD-плеер, и так
//как данное устройство может управлять звуком, то используем при этом объявленный ранее протокол ChangeVolume (листинг 32.2).


//struct DVDPlayer: ChangeVolume {
// // реализация методов и свойств протоколов ...
//}
//32.2. Протокол-ориентированное программирование   425
//Теперь предположим, что мы разработали универсальный пульт, который может
//менять громкость любого устройства, имеющего интерфейс управления звуком
//(соответствует протоколу ChangeVolume) (листинг 32.3).
//Листинг 32.3
struct UniversalManager {
 var currentDevice: ChangeVolume
 func increaseVolume(by: UInt8) -> Void {
 self.currentDevice.increase(by: by)
 }
 // ...
}
// начнем работу с DVD-плеером
//let manager = UniversalManager(currentDevice: DVDPlayer())
//manager.increaseVolume(by: 1)
//// переключимся на работу с телевизором
//manager.currentDevice = TV()
//manager.increaseVolume(by: 5)


//Таким образом, вы можете настроить значение типа UniversalManager хоть на
//работу с TV, хоть на работу с DVDPlayer. В этом и есть суть полиморфизма. Наш
//универсальный пульт может взаимодействовать с любым объектом, не имея информации о его конкретном типе.
//Конечно, можно добиться подобного результата и без протоколов, с помощью
//наследования классов. Но Swift не поддерживает множественное наследование
//классов, зато приветствует его для протоколов.
//ПРИМЕЧАНИЕ Множественное наследование — это наследование от двух и более родите


//32.2. Протокол-ориентированное
//программирование
//В этой книге я не ставил перед собой целей обучить вас подходам объектноориентированного и протокол-ориентированного программирования (ООП
//и ПОП). Для того чтобы глубоко понять их и начать применять, потребуется
//получить опыт разработки реальных приложений на Swift в среде Xcode. Тем
//не менее это не помешает нам кратко ознакомиться с некоторыми элементами
//этих методологий.
//Основные принципы ООП — это:
// наследование;
// инкапсуляция;
// полиморфизм.
//426   Глава 32. Протокол-ориентированное программирование
//С каждым из этих понятий мы уже неоднократно встречались в процессе изучения материала книги. При этом ПОП основан на ООП, но на данный момент не
//имеет четкого и конкретного описания. Впервые об этой методологии упомянули
//на конференции WWDC 15, где Swift был назван первым протокол-ориентированным языком в истории программирования. Но зачем? Почему Swift не может
//в полной мере использовать старый добрый объектно-ориентированный подход?
//На то есть две основные причины.
//Причина № 1. В Swift отсутствует множественное наследование.
//Классы могут наследоваться только от одного родителя, а структуры вообще не
//могут иметь родительские объектные типы. Но при этом у вас есть возможность
//подписывать классы и структуры на множество протоколов.
//Вернемся к рисунку из главы «Последовательности
//и коллекции» (рис. 32.1, схема перевернута для лучшего восприятия). На схеме приведены протоколы,
//которым соответствует тип данных Int. Данный тип
//одновременно выполняет требования множества
//протоколов: и Hashable, и Equatable, и Comparable
//и т. д.
//Если провести глубокий анализ, то станет понятно,
//что соответствия фундаментальных типов и протоколов — это гигантская паутина. Каждый тип данных соответствует множеству протоколов, которые,
//в свою очередь, также наследуют другие протоколы
//и т. д. Таким образом, Swift позволяет использовать
//множественное наследование, но только при работе
//с протоколами.

//Причина № 2. Протоколы позволяют содержать
//реализацию по умолчанию.
//Как уже неоднократно говорилось, в Swift протокол может быть не просто набором
//требований, но также содержать их реализацию. Таким образом, мы можем создать
//множество протоколов, при необходимости указать реализацию по умолчанию
//и при создании объектного типа подписать его на данные протоколы, с ходу обеспечив тип функциональной составляющей. Не написав ни строчки кода в теле
//объектного типа, вы наделяете его возможностями!
//С помощью протоколов принцип «наследование» из ООП в Swift реализуется
//иначе:
// В ООП классы наследуют друг друга, и один дочерний класс может иметь
//множество родительских классов.
// В ПОП (в Swift) класс (или структура) наследует множество протоколов, которые, возможно, помимо самих требований, содержат еще и их собственную
//реализацию.
//Рис. 32.1. Соответствие
//типа Int протоколам
//32.3. Где использовать class и struct   427
//Суть протокол-ориентированного программирования состоит в том, что в первую очередь описываются протоколы, а уже потом объектные типы, принимающие их к реализации.
//Рассмотрим еще один пример.
//Предположим, что вам необходимо описать сущность «Утка» в своей программе.
//В первую очередь выделим категории, в которые данная сущность потенциально
//может входить вместе с другими сущностями. Утка умеет летать — значит, входит
//в категорию «Летающие», умеет плавать — значит, входит в категорию «Плавающие», и умеет ходить, значит, входит в категорию «Ходячие». Основываясь
//на этом, создадим три протокола и структуру, описывающую сущность «Утка»
//(листинг 32.4).


//protocol Walking {}
//protocol Flying {}
//protocol Swimming {}
//struct Duck: Walking, Flying, Swimming {}
//Прелесть такого подхода в том, что если вам потребуется создать другую сущность,
//к примеру «Пингвин», то вы с легкостью подпишете ее только на те протоколы
//(то есть включите только в те группы), которым данная сущность должна соответствовать (листинг 32.5)
//Листинг 32.5
//struct Penguin: Walking, Swimming {}
//О том, насколько хорош подход ПОП, вы сможете понять позже, уже после изучения основ программирования на Swift. Сейчас мне важно, чтобы вы получили
//ознакомительные сведения об этой методологии и в дальнейшем при чтении книг
//и статей не впадали в ступор, а имели определенное представление.
//32.3. Где использовать class и struct
//Как мы уже выяснили, первый элемент любой сущности — это протокол. Именно
//с него необходимо начинать разработку. На основе протоколов создаются объектные типы данных, и для этого вам доступны перечисления (enum), классы (class)
//и структуры (struct). С предназначением перечислений мы разобрались ранее
//в книге, но что делать в остальных случаях? Что использовать для реализации
//каждой конкретной сущности?
//Классы и структуры — очень гибкие конструкции Swift. Наполняя свой код функциональными возможностями, вы непременно будете встречаться с ситуацией,
//в которой неясно, какими средствами лучше решать возникшую задачу. При этом
//428   Глава 32. Протокол-ориентированное программирование
//любая из них может быть решена как с использованием классов, так и с использованием структур. В этом разделе мы поговорим с вами о выборе между class
//и struct при написании программного кода.
//Правила выбора между классом и структурой


//Правила выбора между классом и структурой
//При создании очередной сущности в вашем приложении придерживайтесь следующих правил:
//Правило № 1
//Отдавайте предпочтение структурам, нежели классам.
//Правило № 2
//Используйте классы только тогда, когда вам действительно нужны их особенности.
//Звучит довольно просто и, вероятно, совершенно непонятно. Но что скрывается
//за этими правилами?
//Ответ на вопрос «class или struct?» кроется в отличиях между этими конструкциями. Какое самое важное отличие вы знаете? Структуры — это value type (значимые типы), а классы — это reference type (ссылочные типы).
//Рассмотрим пример. В листинге 32.6 созданы класс и структура, описывающие
//пользователя.
//Листинг 32.6
class UserClass {
 var name: String
 init(name: String) {
     self.name = name
 }
}
struct UserStruct {
 var name: String
}
//При создании параметров типа UserClass и UserStruct мы получим одинаковые
//по своей сути экземпляры, содержащие одноименные свойства (листинг 32.7).
//Листинг 32.7
var userByClass = UserClass(name: "Vasiliy")
var userByStruct = UserStruct(name: "Vasiliy")
//Но мы почувствуем разницу, когда проиницилизируем значения userByClass
//и userByStruct новым параметрам (листинг 32.8).


//var newUserByClass = userByClass
//var newUserByStruct = userByStruct
//Если вы не пропустили главу, посвященную управлению памятью, то уже должны
//знать, чем именно отличаются ссылочные типы от значимых, и должны догадаться, что произойдет. В первом случае мы получим два параметра (userByClass
//и newUserByClass), которые указывают на один и тот же объект в памяти. Во втором
//случае мы получим два независимых значения (userByStruct и newUserByStruct)
//(рис. 32.2).
//Рис. 32.2. Ссылочные и значимые типы
//Данная особенность является основой выбора между структурой и классом. Тем
//не менее правило № 1 говорит о том, что мы должны предпочесть структуры
//классам. Но почему?
//ПРИМЕЧАНИЕ Стоит отметить, что у утверждения «структуры — это value type» есть одно
//исключение. При захвате значения структуры внутри замыкания значение по факту передается по ссылке, а не копируется, если иное не указано явно. Мы говорили об этом в главе об
//управлении памятью


//Причина выбрать структуру № 1. Безопасность
//Структуры безопаснее классов. Множественные копии объекта, в отличие от
//множественных ссылок, не способны привести к случайному, неконтролируемому
//изменению данных. Представьте, что вы используете классы для некоторой сущности в своей программе, а значит, передаете ее значение по ссылке. Существует
//вероятность, что в один из моментов значение данной сущности будет изменено,
//а это, в свою очередь, может привести к ошибкам в другой части программы, где
//работа должна вестись со старой, неизмененной версией экземпляра. Особенно
//это важно при работе в среде мультипоточности (multithearding).
//ПРИМЕЧАНИЕ Swift поддерживает мультипоточность, благодаря которой у вас есть возможность исполнять программный код в несколько потоков, то есть выполнять несколько задач
//одновременно. К примеру, в одном потоке вы можете отправить запрос к удаленному серверу,
//и чтобы не замораживать графический интерфейс приложения в ожидании ответа, в другом
//потоке продолжить обработку действий пользователя (нажатие кнопок, свайпы и т. д.).
//Мультипоточность — это очень интересная, но довольно серьезная тема, с которой необходимо
//знакомиться, уже имея некоторый опыт в создании приложения. В следующих книгах мы обязательно подробно разберем ее.
//430   Глава 32. Протокол-ориентированное программирование
//Причина выбрать структуру № 2. Утечки памяти
//В главе об управлении памятью нами был разобран пример утечки памяти. При
//использовании структур такая проблема исчезает, опять же по причине того, что
//значения передаются копией, а не в виде ссылки.
//Причина выбрать структуру № 3. Раздутые объектные типы
//Swift не поддерживает множественное наследование. Таким образом, у вас отсутствует возможность создать класс — наследник нескольких родительских
//классов. И как уже отмечалось, для структур наследование вообще недоступно.
//Это побуждает создавать огромные раздутые типы-комбайны, которые одновременно способны решать большое количество задач. С точки зрения Best Practice
//(лучшие практики) это плохой подход к разработке. Каждая отдельная сущность
//должна решать строго определенную задачу. Создание «комбайнов» является
//плохим приемом программирования.
//ПРИМЕЧАНИЕ Во второй книге мы подробнее поговорим о дроблении зон ответственности
//с целью создания компактных классов и структур, отвечающих за решение одной конкретной
//задачи.
//При использовании приемов протокол-ориентированного программирования
//и создании протоколов, наполненных не просто требованиями к реализации
//свойств и методов, а непосредственно их реализацией, у вас появляется первоклассный аналог множественного наследования. Это может оказаться очень
//удобным способом наращивания функциональности ваших сущностей.


//Причина выбрать структуру № 4. Структуры быстрее классов
//Проведем простой эксперимент. Создадим аналогичные сущности с помощью
//класса и структуры и протестируем время выполнения 100 миллионов операций
//над ними (листинг 32.9).
import Foundation
class ValueClass {
 var value: Int = 0
}
struct ValueStruct {
 var value: Int = 0
}
var operationArray = Array(1...100_000_000)
// опыт с классом
//var startTime = Date().timeIntervalSince1970
//var a = ValueClass()
//for _ in operationArray {
// a.value += 1
//}
//var finishTime = Date().timeIntervalSince1970
//print("Время выполнения операций с классом - \(finishTime-startTime)")
//// опыт со структурой
//startTime = Date().timeIntervalSince1970
//var b = ValueStruct()
//for _ in operationArray {
// b.value += 1
//}
//finishTime = Date().timeIntervalSince1970
//print("Время выполнения операций со структурой - \(finishTime-startTime)")
//Консоль
//Время выполнения операций с классом - 4.297344923019409
//Время выполнения операций со структурой - 0.07223701477050781
//ПРИМЕЧАНИЕ Тип Date ранее не рассматривался и не использовался в книге. Он предназначен для работы с датой и временем. В данном случае с его помощью получается число,
//описывающее количество секунд, прошедших с 1 января 1970 года, так называемое Unix-время.
//Для его работы требуется импортировать библиотеку Foundation.


//Как вы можете видеть из вывода на консоли, выполнение операций со структурой
//происходит в 60 раз быстрее, чем с классом. Причина этого кроется в организации
//хранения и доступа к классам и структурам в памяти компьютера.
//ПРИМЕЧАНИЕ Вполне вероятно, что конкретное время выполнения, которое покажет ваш
//компьютер, будет отличаться от того, что получилось у меня. Более того, Xcode Playground на
//моем Mac так и не смог выполнить этот код. По этой причине мне пришлось проводить тесты
//на Ubuntu с установленным компилятором Swift.
//Все вышесказанное не означает, что вы всегда должны использовать структуры.
//Классы существуют не просто ради того, чтобы они были, у них также есть своя
//область применения.


//Причина выбрать класс № 1. Логичная передача объекта по ссылке
//Стоит использовать класс в тех случаях, когда однозначно понятно, что лучше передавать объект по ссылке, нежели копировать его. Примерами могут
//служить файловые дескрипторы и сетевые подключения, открытые в ваших
//приложениях.
//Также с помощью классов могут быть реализованы различные контроллеры, производящие контроль/управление объектами, когда объект — это просто менеджер,
//для которого нет необходимости создавать копии. Представьте, что в вашем приложении есть тип User, описывающий пользователя, а также тип UserController,
//производящий контроль над пользователями (значениями типа User).
//432   Глава 32. Протокол-ориентированное программирование
//Подумайте, что лучше использовать для каждого объектного типа:
// Для реализации типа User имеет смысл использовать структуру, так как нам
//не нужны особенности классов.
// Тип UserController UserController — это контроллер, менеджер пользователей,
//производящий управление учетными записями, для которого бессмысленно
//использовать преимущества структуры. Вполне логично, если значение данного
//типа всегда будет передаваться по ссылке, более того, это не приведет к какимлибо описанным выше проблемам.
//В листинге 32.10 приведена реализация данных типов.


//struct User {
// var id: Int
//}
//class UserController {
// var users: [User]
// func add(user: User) {
// // ...
// }
// func removeBy(userID: Int) {
// // ...
// }
// func loadFromStorageBy(userID: Int) -> User {
// // ...
// }
// init(user: User) {
// // ...
// }
//}


//Причина выбрать класс № 2. Совместимость c Objective-C
//Если на ваши плечи ляжет необходимость поддержки старых проектов, написанных на Objective-C, или использования старых библиотек, то классы станут
//вашим верным другом.
//ПРИМЕЧАНИЕ В данной книге не рассматриваются примеры совместного использования
//Swift и Objective-C кода.
//Со временем вы поймете реальное значение и отличия value type и reference type,
//и это позволит вам без труда выбирать необходимые элементы языка. Тем не
//менее уже сейчас, при создании каждой новой сущности задавайтесь вопросом,
//с помощью каких конструктивных элементов Swift она должна быть реализована.
