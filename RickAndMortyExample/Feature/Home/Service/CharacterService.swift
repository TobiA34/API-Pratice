//
//  CharacterService.swift
//  RickAndMortyExample
//
//  Created by Tobi Adegoroye on 24/05/2019.
//  Copyright © 2019 Tobi Adegoroye. All rights reserved.
//

import Foundation
import Alamofire


class CharacterService {
    
    func getCharacters(completion: @escaping (Swift.Result<Array<Character>, Error>) -> ()) {
        
        let urlString = "https://rickandmortyapi.com/api/character"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            
            DispatchQueue.main.async {
                
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                do {
                    let decoder =  JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Full)
                    let characterResult = try decoder.decode(CharacterResult.self, from: data ?? Data())
                    
                    completion(.success(characterResult.characters ?? []))
                    
                } catch let jsonError {
                    completion(.failure(jsonError))
                }
            }
            
            }.resume()
    }
}
