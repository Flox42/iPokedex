//
//  Pokemon.swift
//  iPokedex
//
//  Created by Florian Poncelin on 15/08/2016.
//  Copyright © 2016 Florian Poncelin. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {
    private var _name: String!
    private var _pokedexId: Int!
    private var _description: String!
    private var _type: String!
    private var _defense: String!
    private var _height: String!
    private var _weight: String!
    private var _attack: String!
    private var _nextEvoTxt: String!
    private var _pokemonUrl: String!
    
    var name: String {
        return _name
    }
    var pokedexId: Int {
        return _pokedexId
    }
    
    init(name: String, pokedexId: Int) {
        self._name = name
        self._pokedexId = pokedexId
        
        _pokemonUrl = "\(URL_BASE)\(URL_POKEMON)\(self._pokedexId)/"
    }
    
    func downloadPokemonDetails(completed: DownloadComplete) {
        let url = NSURL(string: _pokemonUrl)!
        Alamofire.request(.GET, url).responseJSON { response in
            let result = response.result
            if let dict = result.value as? Dictionary<String, AnyObject> {
                if let weight = dict["weight"] as? Int {
                    self._weight = "\(weight)"
                }
                if let height = dict["height"] as? Int {
                    self._height = "\(height)"
                }
                if let stats = dict["stats"] as? [Dictionary<String, AnyObject>] {
                    if let attack = stats[4]["base_stat"] as? Int {
                        self._attack = "\(attack)"
                    }
                    
                    if let defense = stats[3]["base_stat"] as? Int {
                        self._defense = "\(defense)"
                    }
                }
                
                print(self._weight)
                print(self._height)
                print(self._attack)
                print(self._defense)
                
                if let types = dict["types"] as? [Dictionary<String, AnyObject>] where types.count > 0 {
                    if let type = types[0]["type"] as? Dictionary<String, AnyObject> {
                        if let typeName = type["name"] as? String {
                            self._type = typeName.capitalizedString
                        }
                    }
                    if types.count > 1 {
                        for i in 1..<types.count {
                            if let type = types[i]["type"] as? Dictionary<String, AnyObject> {
                                if let typeName = type["name"] as? String {
                                    self._type! += "/\(typeName.capitalizedString)"
                                }
                            }
                        }
                    }
                } else {
                    self._type = ""
                }
                
                print(self._type)
                
            }
        }
    }
}