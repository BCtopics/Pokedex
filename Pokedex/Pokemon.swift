//
//  Pokemon.swift
//  Pokedex
//
//  Created by Bradley GIlmore on 4/11/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

import Foundation

//MARK: - Keys

fileprivate let kName = "name"
fileprivate let kID = "id"
fileprivate let kAbilities = "abilities"

//MARK: - Pokemon Model

struct Pokemon {
    
    //MARK: - Internal Properties
    
    let name: String
    let id: Int
    let abilities: [String]
    
}

//MARK: - Dictionary Representation

extension Pokemon {
    
    init?(dictionary: [String: Any]) {
        guard let name = dictionary[kName] as? String,
            let id = dictionary[kID] as? Int,
            let abilitiyDictionaries = dictionary[kAbilities] as? [[String:AnyObject]] else {
                return nil
        }
        
        let abilities = abilitiyDictionaries.flatMap { $0["ability"]?["name"] as? String }
        
        self.init(name: name, id: id, abilities: abilities)
    }
    
}
