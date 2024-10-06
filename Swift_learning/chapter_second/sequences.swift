//
//  sequences.swift
//  Swift_learning
//
//  Created by Даниил Асташов on 06.10.2024.
//

import Foundation

struct myArray<T>{
    private var buffer: UnsafeBufferPointer<T>? //указатель на начало массива
    private var _count: Int = 0 //текущее количество элементов
    private var _capacity: Int = 0 //максимальная емкость массива
    
    /*Здесь инициализатор пустой, потому что массив создаётся без элементов и с нулевой ёмкостью. Структура может начинать с _count = 0 и _capacity = 0, пока не будет добавлен первый элемент*/
    init(){}
}
