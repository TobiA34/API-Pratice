//
//  CharacterResult.swift
//  RickAndMortyExample
//
//  Created by Tobi Adegoroye on 25/05/2019.
//  Copyright © 2019 Tobi Adegoroye. All rights reserved.
//

import Foundation

struct CharacterResult: Decodable {
    let info: CharacterInfo?
    let characters: Array<Character>?
    
    enum CodingKeys: String,CodingKey{
        case info
        case characters = "results"
    }
    
}
