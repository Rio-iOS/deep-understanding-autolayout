//
//  Person.swift
//  chapter07
//
//  Created by 藤門莉生 on 2024/08/16.
//

import Foundation

struct Person {
    let name: String
    let detail: String
    
    init (name: String, detail: String) {
        self.name = name
        self.detail = detail
    }   
}

extension Person {
    static func generateCellData() -> [Person] {
        guard
            let path = Bundle.main.path(forResource: "people", ofType: "plist"),
            let dictionary = NSArray(contentsOf: .init(filePath: path))
        else {
            return []
        }
        
        let people = (0..<100).compactMap { _ -> Person? in
            let index = Int.random(in: 0..<dictionary.count)
            guard
                let person = dictionary[index] as? [String: String],
                let name = person["name"],
                let detail = person["detail"]
            else {
                return nil
            }
            
            return Person(name: name, detail: detail)
        }
        
        return people
    }
}
