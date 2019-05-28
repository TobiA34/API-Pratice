//
//  CharactersViewController.swift
//  RickAndMortyExample
//
//  Created by Tobi Adegoroye on 22/05/2019.
//  Copyright © 2019 Tobi Adegoroye. All rights reserved.
//

import UIKit


class CharactersViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private let characterService = CharacterService()
    private let audioManager = AudioManager()
    private var datasource: Array<Character> = [] {
        didSet{
            tableView.reloadData()
        }
    }
    
    @IBAction func playBtnDidTouch(_ sender: Any) {
        audioManager.playMusic(fileName: "getSchwifty")
    }
    
    @IBAction func stopBtnDidTouch(_ sender: Any) {
        audioManager.stopMusic(fileName: "getSchwifty")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getAllCharacters()
        setupTableView()
    }
}

extension CharactersViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let character = datasource[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: CharacterTableViewCell.cellID, for: indexPath) as? CharacterTableViewCell
        cell?.configure(with: character)
        return cell!
    }
    
}

private extension CharactersViewController {
    
    func setupTableView(){
        tableView.tableFooterView = UIView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        tableView.register(UINib(nibName: "CharacterTableViewCell" ,bundle: nil), forCellReuseIdentifier: CharacterTableViewCell.cellID)
        
    }
    
    
    func getAllCharacters(){
        
        characterService.getCharacters { res in
            switch res {
            case .success(let characters):
                self.datasource = characters
            case .failure(let error):
                print("Failed to fetch courses:", error)
            }
        }
    }
    
    
    
    
    
}
