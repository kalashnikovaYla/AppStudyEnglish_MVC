//
//  Card.swift
//  AppStudyEnglish_MVC
//
//  Created by sss on 07.01.2023.
//

import Foundation

struct Card {
    
    var wordInEnglish: String
    var transiateInRussian: String
    var nameOfImage: String
    var answer: [String]
}


//MARK: Create Instances

extension Card {
    
    static var arrayData = [
        
        Card(wordInEnglish: "Programmer", transiateInRussian: "программист", nameOfImage: "1", answer: ["Teacher", "Programmer", "Soft"]),
        
        Card(wordInEnglish: "Calculator", transiateInRussian: "калькулятор", nameOfImage: "2", answer: ["Cell phone", "Calculator", "Ruler"]),
        
        Card(wordInEnglish: "Camera", transiateInRussian: "камера", nameOfImage: "3", answer: ["Camera", "Glasses", "Cassette"]),
        
        
        Card(wordInEnglish: "Teacher", transiateInRussian: "учитель", nameOfImage: "4", answer: ["Nurse", "Cleaner", "Teacher"]),
        
        Card(wordInEnglish: "Soccer", transiateInRussian: "футбол", nameOfImage: "5", answer: ["Soccer", "Hockey", "Water polo"]),
        
        
        Card(wordInEnglish: "Map", transiateInRussian: "карта", nameOfImage: "6", answer: ["Notebook", "Map", "List"]),
        
        Card(wordInEnglish: "Wallet", transiateInRussian: "кошелек", nameOfImage: "7", answer: ["Money", "Wallet", "ATM"]),
        
        Card(wordInEnglish: "Zebra", transiateInRussian: "зебра", nameOfImage: "8", answer: ["Elephant", "Zebra", "Giraffe"]),
        
        Card(wordInEnglish: "Backpack", transiateInRussian: "рюкзак", nameOfImage: "9", answer: ["Backpack", "Briefcase", "Baggage"]),
        
        Card(wordInEnglish: "Store", transiateInRussian: "магазин", nameOfImage: "10", answer: ["Magazine", "Store", "Build"]),
        
        
        Card(wordInEnglish: "Cinema", transiateInRussian: "кино", nameOfImage: "11", answer: ["Cinema", "Ticket", "Opera"]),
        
        Card(wordInEnglish: "Cristmas presents", transiateInRussian: "рождественские подарки", nameOfImage: "12", answer: ["Cristmas toys", "Cristmas presents", "Cristmas holidays"]),
        
        Card(wordInEnglish: "Ice cream", transiateInRussian: "мороженое", nameOfImage: "13", answer: ["Ice cream", "Jam", "Preserve"]),
        
        Card(wordInEnglish: "Cup of coffee", transiateInRussian: "кружка кофе", nameOfImage: "14", answer: ["Glass of wine","Cup of coffee", "Boutle of water"]),
        
        Card(wordInEnglish: "Cup of tea", transiateInRussian: "кружка чая", nameOfImage: "15", answer: ["Glass of wine","Cup of tea", "Boutle of water"]),
        
        Card(wordInEnglish: "Crab", transiateInRussian: "краб", nameOfImage: "16", answer: ["Crab", "Fish", "Octopus"]),
       
        Card(wordInEnglish: "Cake", transiateInRussian: "торт", nameOfImage: "17", answer: ["Cake", "Cookies", "Lollipops"]),
        
        Card(wordInEnglish: "Doctor", transiateInRussian: "доктор", nameOfImage: "18", answer: ["Doctor", "Nurse", "Cleaner"]),
        
        Card(wordInEnglish: "Suitcase", transiateInRussian: "чемодан", nameOfImage: "19", answer: ["Backpack", "Briefcase", "Suitcase"]),
        
        Card(wordInEnglish: "Cupcake", transiateInRussian: "пирожное", nameOfImage: "20", answer: ["Chocolate", "Flour", "Cupcake"]),
        
        Card(wordInEnglish: "Dog", transiateInRussian: "собака", nameOfImage: "21", answer: ["Octopus", "Dog", "Mouse"]),
        
        Card(wordInEnglish: "Grape", transiateInRussian: "виноград", nameOfImage: "22", answer: ["Grape", "Pineapple", "Kiwi"]),
        
        Card(wordInEnglish: "Cat", transiateInRussian: "кошка", nameOfImage: "23", answer: ["Dog", "Mouse", "Cat"]),
        
        Card(wordInEnglish: "Christmas decorations", transiateInRussian: "елочные украшения", nameOfImage: "24", answer: ["Christmas decorations", "Cristmas presents", "Cristmas holidays"]),
        
        Card(wordInEnglish: "Chicken", transiateInRussian: "курица", nameOfImage: "25", answer: ["Meal", "Fast food", "Chicken"])
    
    
    ]
}
