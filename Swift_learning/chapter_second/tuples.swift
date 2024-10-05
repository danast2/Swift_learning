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

func comperhension(fp: (name: String, age: Int), sp:(name: String, age: Int)) -> (Bool, Bool, Bool){
    //let ans = (fp_maj: fp.age > sp.age, sp_maj: fp.age < sp.age,eq: fp.age == sp.age)
    return (fp_maj: fp.age > sp.age, sp_maj: fp.age < sp.age,eq: fp.age == sp.age)
}
