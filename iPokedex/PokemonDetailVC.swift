//
//  PokemonDetailVC.swift
//  iPokedex
//
//  Created by Florian Poncelin on 16/08/2016.
//  Copyright © 2016 Florian Poncelin. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
    
    @IBOutlet weak var nameLbl: UILabel!
     
    var pokemon: Pokemon!

    override func viewDidLoad() {
        super.viewDidLoad()

        nameLbl.text = pokemon.name
    }

}
