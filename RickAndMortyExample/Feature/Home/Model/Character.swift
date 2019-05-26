//
//  CharacterDescription.swift
//  RickAndMortyExample
//
//  Created by Tobi Adegoroye on 25/05/2019.
//  Copyright © 2019 Tobi Adegoroye. All rights reserved.
//

import Foundation

struct Character: Decodable {
    let id: Int?
    let name: String?
    let status: String?
    let species: String?
    let type: String?
    let gender: String?
    let origin: Origin?
    let location: Origin?
    let image: String?
    let episode: Array<String>?
    let url: String?
    let date: Date?
}


