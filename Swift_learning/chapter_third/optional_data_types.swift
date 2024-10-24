//
//  optional_data_types.swift
//  Swift_learning
//
//  Created by Даниил Асташов on 11.10.2024.
//

import Foundation


/**Опциональные типы данных, также называемые опционалами, — это особый тип,
 который говорит о том, что параметр либо имеет значение определенного типа,
 либо вообще не имеет никакого значения. Иногда очень полезно оперировать отсутствием значения.*/
var sas_new : String?

let possibleString = "1945"
let convertPossibleString = Int(possibleString) // 1945
let unpossibleString = "Одна тысяча сто десять"
let convertUnpossibleString = Int(unpossibleString) // nil

/**Самое интересное, что в обоих случаях (и при числовом, и при строковом значении переданного аргумента) возвращается значение опционального типа данных.
 То есть 1945 — это значение не целочисленного, а опционального целочисленного
 типа данных. Также и nil — в данном примере это указатель на отсутствие значения в хранилище опционального целочисленного типа.
 В этом примере функция Int(_:) возвращает опционал, то есть значение такого
 типа данных, который может либо содержать конкретное значение (целое число),
 либо не содержать совершенно ничего (nil).
 Опционалы — это отдельная самостоятельная группа типов данных. Целочисленный тип и опциональный целочисленный тип — это два совершенно разных
 типа данных. По этой причине опционалы должны иметь собственное обозначение типа. И они его имеют. Убедимся в этом, определив тип данных констант из
 предыдущего листинга (листинг 11.2).*/


//type(of: convertPossibleString) // Optional<Int>.Type
//type(of: convertUnpossibleString) // Optional<Int>.Type


/**Optional<Int> — это идентификатор опционального целочисленного типа данных,
 то есть значение такого типа может либо быть целым числом, либо отсутствовать
 полностью. Тип Int является базовым для этого опционала, то есть основан на
 типе Int.
 Более того, опциональные типы данных всегда строятся на основе базовых неопциональных. Они могут брать за основу совершенно любой тип данных, включая
 Bool, String, Float и Double, а также типы данных кортежей, ваши собственные
 типы, типы коллекций и т. д.
 Напомню, что опционалы являются самостоятельными типами, отличными от
 базовых, то есть тип Int и тип Optional<Int> — это два разных типа данных
 
 
 
 Функция Int(_:) не всегда возвращает опционал, а лишь в том случае, если
 в нее передано нечисловое значение. Так, если в Int(_:) передается значение типа Double,
 то нет никакой необходимости возвращать опционал, так как при любом значении Double оно
 может быть преобразовано в Int (чего нельзя сказать про преобразование String в Int).
 11.1. Введение в опционалы   229
 Далее показано, что приведение String и Double к Int дает значения различных типов данных
 (Optional<Int> и Int).
 let x1 = Int("12")
 type(of: x1) // Optional<Int>.Type
 let x2 = Int(43.2)
 type(of: x2) // Int.Type
 */


/*В общем случае тип данных опционала имеет две формы записи.
 СИНТАКСИС
 Полная форма записи:
 Optional<T>
 Краткая форма записи:
 T?
 T: Any — наименование типа данных, на котором основан опционал.
 При объявлении параметра, имеющего опциональный тип, необходимо явно
 указать его тип данных. Для этого можно использовать полную форму записи.
 В листинге 11.3 приведен пример объявления переменной опционального типа,
 основанного на Character.
 Листинг 11.3
 let optionalChar: Optional<Character> = "a"
 При объявлении опционала Swift также позволяет использовать сокращенный
 синтаксис. Для этого в конце базового типа необходимо добавить знак вопроса, никаких других элементов не требуется. Таким образом, тип Optional<Int>
 может быть переписан в Int?, Optional<String> в String? и в любой другой тип.
 В листинге 11.4 показан пример объявления опционала с использованием сокращенного синтаксиса.
 Листинг 11.4
 var xCoordinate: Int? = 12
 В любой момент значение опционала может быть изменено на nil. Это можно
 сделать как и при объявлении параметра, так и потом (листинг 11.5).
 Листинг 11.5
 xCoordinate // 12
 xCoordinate = nil
 xCoordinate // nil
 Переменная xCoordinate является переменной опционального целочисленного
 типа данных Int?. Изначально ей было присвоено значение, соответствующее
 базовому для опционала типу данных, которое позже было заменено на nil (то есть
 значение переменной было уничтожено).
 
 
 Листинг 11.6
 var someOptional: Bool? // nil
 Для создания опционала помимо явного указания типа также можно использовать функцию Optional(_:), в которую необходимо передать инициализируемое
 значение требуемого базового типа (листинг 11.7).
 Листинг 11.7
 // опциональная переменная с установленным значением
 var optionalVar = Optional("stringValue") // "stringValue"
 // уничтожаем значение опциональной переменной
 optionalVar = nil // nil
 type(of: optionalVar) // Optional<String>.Type
 Так как в функцию Optional(_:) в качестве аргумента передано значение
 типа String, то возвращаемое ею значение имеет опциональный строковый тип
 данных String? (или Optional<String>, что является синонимами).
 
 
 //опционалы в кортежах
 Так как в качестве базового для опционалов может выступать любой тип данных,
 вы можете использовать в том числе и кортежи. В листинге 11.8 приведен пример
 объявления опционального кортежа.
 Листинг 11.8
 var tuple: (code: Int, message: String)? = nil
 tuple = (404, "Page not found") // (code 404, message "Page not found")
 В этом примере опциональный тип основан на типе кортежа (Int, String).
 При необходимости вы можете использовать опционал для отдельных элементов
 кортежей (листинг 11.9).
 Листинг 11.9
 let tupleWithoptelements: (Int?, Int) = (nil, 100)
 tupleWithoptelements.0 // nil
 tupleWithoptelements.1 // 100
 
 
 //извлечение опционального значения
 Важно отметить, что нельзя производить прямые операции между значениями
 опционального и базового типов данных, так как это приведет к ошибке (листинг 11.10).
 11.2. Извлечение опционального значения   231
 Листинг 11.10
 let a: Int = 4
 let b: Int? = 5
 a+b // ОШИБКА. Несоответствие типов
 В переменной a хранится значение неопционального типа Int, в то время как
 значение b является опциональным (Int?).
 Типы Int? и Int, String? и String, Bool? и Bool — все это разные типы данных.
 Для решения проблемы их взаимодействия можно применить прием, называемый
 извлечением опционального значения, или, другими словами, преобразовать
 опционал в соответствующий ему базовый тип.
 Выделяют три способа извлечения опционального значения:
  принудительное извлечение;
  косвенное извлечение;
  операция объединения с nil (рассматривается в конце главы).
 После извлечения значение опционального типа приводится к базовому, а значит, может взаимодействовать с другими значениями базового типа. Рассмотрим
 каждый из указанных способов подробнее.
 
 //принудительное извлечение значения
 
 Принудительное извлечение (force unwrapping) преобразует значение опционального типа в значение базового (например, Int? в Int) с помощью знака восклицания (!), указываемого после имени параметра с опциональным значением.
 Пример принудительного извлечения приведен в листинге 11.11.
 Листинг 11.11
 var optVar: Int? = 12
 var intVar = 34
 let result = optVar! + 34 // 46
 // проверяем тип данных извлеченного значения
 type(of: optVar!) // Int.Type
 Константа optVar — это опционал. Для проведения арифметической операции
 с целочисленным значением используется принудительное извлечение (после имени переменной указан восклицательный знак). Таким образом, операция сложения
 производится между двумя неопциональными целочисленными значениями.
 Точно такой же подход используется и при работе с типами, отличными от Int
 (листинг 11.12).
 Листинг 11.12
 let optString: String? = "Vasiliy Usov"
 let unwrapperString = optString!
 print( "My name is \(unwrapperString)" )
 232   Глава 11. Опциональные типы данных
 Консоль
 My name is Vasiliy Usov
 При всем удобстве этого способа вам нужно быть крайне осторожными. На
 рис. 11.1 показано, что происходит, когда производится попытка извлечения несуществующего значения.
 
 //косвенное извлечение значения
 
 В противовес принудительному извлечению опционального значения Swift предлагает использовать косвенное извлечение опционального значения (implicitly
 unwrapping).
 Если вы уверены, что в момент проведения операции с опционалом в нем всегда
 будет значение (не nil), то при явном указании типа данных знак вопроса может
 быть заменен на знак восклицания. При этом все последующие обращения к параметру необходимо производить без принудительного извлечения, так как оно
 будет происходить автоматически (листинг 11.13).
 Листинг 11.13
 var wrapInt: Double! = 3.14
 // сложение со значением базового типа не вызовет ошибок
 // при этом не требуется использовать принудительное извлечение
 wrapInt + 0.12 // 3.26
 11.3. Проверка наличия значения в опционале   233
 Запомните, что отсутствие значения в опционале приведет к ошибке приложения
 (а это, напоминаю, чревато плохими отзывами пользователей).
 
 
 //проверка наличия значения в опционале
 
 Для осуществления проверки наличия значения в опционале его можно сравнить
 с nil. При этом будет возвращено логическое true или false в зависимости от
 наличия значения (листинг 11.14).
 Листинг 11.14
 let optOne: UInt? = nil
 let optTwo: UInt? = 32
 optOne != nil // false
 optTwo != nil // true
 Подобное выражение можно использовать совместно с оператором условия if.
 Если в опционале имеется значение, то в теле оператора оно может быть извлечено без ошибок.
 В листинге 11.15 приведен пример, в котором определяется количество положительных оценок, а точнее пятерок. Если пятерки есть, то вычисляется количество
 пирожных, которые необходимо приобрести в награду за старания.
 Листинг 11.15
 var fiveMarkCount: Int? = 8
 var allCakesCount = 0;
 // определение наличия значения
 if fiveMarkCount != nil {
  // количество пирожных за каждую пятерку
  let cakeForEachFiveMark = 2
  // общее количество пирожных
  allCakesCount = cakeForEachFiveMark * fiveMarkCount!
 }
 allCakesCount // 16
 
 
 В ходе проверки наличия значения в опционале существует возможность одновременного извлечения значения (если оно не nil) и инициализации его во временный параметр. Этот способ носит название опционального связывания (optional
 binding) и является наиболее корректным способом работы с опционалами.
 СИНТАКСИС
 if let связываемый_параметр = опционал {
  // тело оператора
 }
 В результате опционального связывания создается связанный параметр, в котором при возможности извлекается значение опционала. Если опционал не равен nil, то будет выполнен код в теле оператора, в котором значение опционала будет доступно через связанный
 параметр.
 Пример
 if let userName = userLogin {
  print("Имя: \(userName)")
 } else {
  print("Имя не введено")
 }
 // userLogin - опционал
 type(of: userLogin) // Optional<String>.Type
 ПРИМЕЧАНИЕ Напомню, что область видимости определяет, где в коде доступен некоторый
 объект. Если этот объект является глобальным, то он доступен в любой точке программы (его
 область видимости не ограничена). Если объект является локальным, то он доступен только
 в том блоке кода (и во всех вложенных в него блоках), для которого является локальным. Вне
 этого блока объект просто не виден.
 В листинге 11.16 показан пример использования опционального связывания.
 Листинг 11.16
 let markCount: Int? = 8
 // определение наличия значения
 if let marks = markCount {
  print("Всего \(marks) оценок")
 }
 Консоль
 Всего 8 оценок
 
 
 Листинг 11.17
 var pointX: Int? = 10
 var pointY: Int? = 3
 if let x = pointX, let y = pointY {
  print("Точка установлена на плоскости")
 }
 Консоль
 Точка установлена на плоскости
 В этом примере проверяется наличие значений в обеих переменных. Если бы хоть
 одна из переменных соответствовала nil, то вывод на консоль оказался бы пуст.
 Во время написания последнего листинга вы получили от Xcode уведомление
 (желтого цвета) о том, что объявленные в ходе опционального связывания константы не используются в теле оператора, вследствие чего они могут быть заменены нижним подчеркиванием _ (рис. 11.2).
 Рис. 11.2. Предупреждение от Xcode
 Ранее мы уже неоднократно встречались с нижним подчеркиванием, позволяющим
 игнорировать определенные элементы или значения. Напомню, что оно может заменять имена параметров в тех случаях, когда в их объявлении нет необходимости.
 В данном примере опциональное связывание требуется лишь с целью определения
 наличия значений в опционалах, при этом внутри блока кода оператора условия
 созданные параметры не используются. Поэтому можно последовать совету среды разработки и заменить имена констант на нижнее подчеркивание. Код в этом
 случае будет работать без ошибок (листинг 11.18).
 Листинг 11.18
 if let _ = pointX, let _ = pointY {
  print("Точка установлена на плоскости")
 }
 
 Листинг 11.19
 if let x = pointX, x > 5 {
  print("Точка очень далеко от вас ")
 }
 Консоль
 Точка очень далеко от вас
 
 11.5. Опциональное связывание как часть
 оптимизации кода
 Рассмотрим еще один вариант грамотного применения опционального связывания
 на примере уже полюбившейся нам функции Int(_:).
 Все любят драконов! А все драконы любят золото! Представьте, что у вас есть
 группа драконов, у большинства из которых есть свой сундук с золотом, а количество золотых монет в каждом из этих сундуков разное. В любой момент времени
 может потребоваться знать общее количество монет во всех сундуках. Внезапно
 к вам поступает новый дракон, его золото тоже должно быть учтено.
 Напишем код, в котором определяется количество монет в сундуке нового дракона (если, конечно, у него есть сундук), после чего оно суммируется с общим
 количеством золота (листинг 11.20).
 Листинг 11.20
 /* переменная типа String,
 содержащая количество золотых монет
 в сундуке нового дракона */
 var coinsInNewChest = "140"
 /* переменная типа Int,
 в которой будет храниться общее
 количество монет у всех драконов */
 var allCoinsCount = 1301
 // проверяем существование значения
 if Int(coinsInNewChest) != nil {
  allCoinsCount += Int(coinsInNewChest)!
 } else {
  print("У нового дракона отсутствует золото")
 }
 
 ПРИМЕЧАНИЕ У вас мог возникнуть вопрос, почему в качестве количества монет в сундуке
 не используется значение целочисленного типа. На то есть три причины:
 • это пример, который позволяет вам подробнее рассмотреть работу опционалов;
 11.5. Опциональное связывание как часть оптимизации кода   237
 • в интерфейсе мнимой программы, вполне вероятно, будет находиться текстовое поле, в котором будет вводиться строковое значение, содержащее количество монет;
 • монеты могут отсутствовать по причине отсутствия сундука, а 0 в качестве значения говорит
 о том, что сундук есть, но монет в нем нет.
 На первый взгляд все очень просто и логично, и в результате значение переменной allCoinsCount станет равно 1441. Но обратите внимание, что
 Int(coinsInNewChest) используется дважды:
  при сравнении с nil;
  при сложении с переменной allCoinsCount.
 В результате происходит бесцельная трата процессорного времени, так как одна
 и та же функция выполняется дважды. Можно избежать такой ситуации, заранее создав переменную coins, в которую будет извлечено значение опционала.
 Данную переменную необходимо использовать в обоих случаях вместо вызова
 функции Int(_:) (листинг 11.21)
 
 let coinsInNewChest = "140"
 var allCoinsCount = 1301
 /* извлекаем значение опционала
 в новую переменную */
 var coins = Int(coinsInNewChest)
 /* проверяем существование значения
 с использованием созданной переменной */
 if coins != nil {
  allCoinsCount += coins!
 } else {
  print("У нового дракона отсутствует золото")
 }
 
 Несмотря на то что приведенный код в полной мере решает поставленную задачу, у него есть один недостаток: созданная переменная coins будет существовать
 (а значит, и занимать оперативную память) даже после завершения работы условного оператора, хотя в ней нет необходимости.
 Необходимо всеми доступными способами избегать бесполезного расходования
 ресурсов компьютера, к которым относится и процессорное время, и оперативная
 память.
 Чтобы избежать расходования памяти, можно использовать опциональное связывание, так как после выполнения оператора условия созданная при связывании
 переменная автоматически удалится (листинг 11.22).
 Листинг 11.22
 let coinsInNewChest = "140"
 var allCoinsCount = 1301
 /* проверяем существование значения
 с использованием опционального связывания */
 238   Глава 11. Опциональные типы данных
 if let coins = Int(coinsInNewChest) {
  allCoinsCount += coins
 } else {
  print("У нового дракона отсутствует золото")
 }
 Мы избавились от повторного вызова функций Int(_:) и расходования оперативной памяти, получив красивый и оптимизированный код. В данном примере вы,
 вероятно, не ощутите увеличения скорости работы программы, но при разработке
 более сложных приложений для мобильных или стационарных устройств данный
 подход позволит получать вполне ощутимые результаты.
 
 
 11.6. Оператор объединения с nil
 Говоря об опционалах, осталось рассмотреть еще один способ извлечения значения,
 известный как операция объединения с nil (nil coalescing). С помощью оператора ?? (называемого оператором объединения с nil) возвращается либо значение
 опционала, либо значение по умолчанию (если опционал равен nil).
 СИНТАКСИС
 let имя_параметра = имя_опционала ?? значение_по_умолчанию
 имя_параметра: T — имя нового параметра, в который будет извлекаться значение опционала.
 имя_опционала: Optional<T> — имя параметра опционального типа, из которого извлекается значение.
 значение_по-умолчанию: T — значение, инициализируемое новому параметру в случае,
 если опционал равен nil.
 Если опционал не равен nil, то опциональное значение извлекается и инициализируется
 в объявленный параметр.
 Если опционал равен nil, то в параметре инициализируется значение, расположенное
 справа от оператора ??.
 Базовый тип опционала и тип значения по умолчанию должны быть одним и тем же типом
 данных.
 Вместо оператора let может быть использован оператор var.
 В листинге 11.23 показан пример использования оператора объединения с nil
 для извлечения значения.
 
 Листинг 11.23
 let optionalInt: Int? = 20
 var mustHaveResult = optionalInt ?? 0 // 20
 11.7. Где использовать опциональные значения   239
 Таким образом, константе mustHaveResult будет проинициализировано целочисленное значение. Так как в optionalInt есть значение, оно будет извлечено
 и присвоено константе mustHaveResult. Если бы optionalInt был равен nil, то
 mustHaveResult принял бы значение 0.
 Код из предыдущего листинга эквивалентен приведенному в листинге 11.24.
 Листинг 11.24
 let optionalInt: Int? = 20
 var mustHaveResult: Int = 0
 if let unwrapped = optionalInt {
  mustHaveResult = unwrapped
 } else {
  mustHaveResult = 0
 }
 Наиболее безопасными способами извлечения значений из опционалов являются
 опциональное связывание и nil coalescing. Старайтесь использовать именно их
 в своих приложениях.
 */
