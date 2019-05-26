//
//  CharacterInfo.swift
//  RickAndMortyExample
//
//  Created by Tobi Adegoroye on 25/05/2019.
//  Copyright © 2019 Tobi Adegoroye. All rights reserved.
//

import Foundation

struct CharacterInfo: Decodable {
    let count: Int
    let pages: Int
    let next: String
    let prev: String
}
