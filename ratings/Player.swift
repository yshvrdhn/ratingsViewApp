//
//  Player.swift
//  ratings
//
//  Created by Yashovardhan Chaturvedi on 16/01/16.
//  Copyright © 2016 YC. All rights reserved.
//

import UIKit

struct Player{
    var name : String?
    var game : String?
    var rating : Int
    
    init(name: String?,game : String?, rating : Int) {
    self.name = name
    self.game = game
    self.rating = rating
 }
    
}
