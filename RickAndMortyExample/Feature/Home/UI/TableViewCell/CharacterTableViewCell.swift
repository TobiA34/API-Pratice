//
//  CharacterTableViewCell.swift
//  RickAndMortyExample
//
//  Created by Tobi Adegoroye on 25/05/2019.
//  Copyright © 2019 Tobi Adegoroye. All rights reserved.
//

import UIKit
import Kingfisher
class CharacterTableViewCell: UITableViewCell {
   
    static let cellID = "CharacterTableViewCell"
    
    @IBOutlet private weak var nameLbl: UILabel!
    @IBOutlet private weak var characterImageView: UIImageView!
    
    
    func configure(with character: Character){
        nameLbl.text = character.name
        characterImageView.kf.indicatorType = .activity
        characterImageView.kf.setImage(with: URL(string: character.image ?? ""))
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        characterImageView.image = nil
        nameLbl.text = nil
    }
    
}
