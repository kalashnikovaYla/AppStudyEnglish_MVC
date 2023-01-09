//
//  Book.swift
//  AppStudyEnglish_MVC
//
//  Created by sss on 07.01.2023.
//

import Foundation

struct Book {
    let name: String
    let resource: String
    let nameOfImage: String
}

//MARK: Create Instances

extension Book {
    
    static let arrayOfBooks = [
        Book(name: "The New Yorker. December 20, 2021", resource: "The New Yorker. December 20, 2021", nameOfImage: "bookList1"),
        Book(name: "List of books", resource: "List of books", nameOfImage: "bookList2")
    
    ]
}
