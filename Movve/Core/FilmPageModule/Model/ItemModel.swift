//
//  ItemModel.swift
//  Movve
//
//  Created by Fed on 24.08.2022.
//

import Foundation
import UIKit

struct ItemModel {
    let itemName: String
    let itemYear: String
    let itemGenre: String
    let itemTime: String
    let itemRate: Double
    let itemDescription: String
    let itemActors: [ActorModel]
    let itemUrl: URL
}

struct ActorModel {
    let name: String
    let role: String
    let image: UIImage
}
