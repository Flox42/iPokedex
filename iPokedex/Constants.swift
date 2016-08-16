//
//  Constants.swift
//  iPokedex
//
//  Created by Florian Poncelin on 16/08/2016.
//  Copyright © 2016 Florian Poncelin. All rights reserved.
//

import Foundation

let URL_BASE = "http://pokeapi.co"
let URL_POKEMON = "/api/v1/pokemon/"

typealias DownloadComplete = () -> () //this is a closure taking no parameter and returning no value, used to notify the app when the download has been completed