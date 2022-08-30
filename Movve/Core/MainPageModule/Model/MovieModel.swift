//
//  MovieModel.swift
//  Movve
//
//  Created by Fed on 17.08.2022.
//

import Foundation

struct MovieModel {    
    let name: String
    let description: String
    let rate: Double
    let date: String
    let image: String
    let genreId: [Int]
    var genre: [Genre] {
        var array: [Genre] = []
        for genre in genreId {
            switch genre {
            case 28:
                array.append(.Action)
            case 12:
                array.append(.Adventure)
            case 16:
                array.append(.Animation)
            case 35:
                array.append(.Comedy)
            case 80:
                array.append(.Crime)
            case 99:
                array.append(.Documentary)
            case 18:
                array.append(.Drama)
            case 10751:
                array.append(.Family)
            case 14:
                array.append(.Fantasy)
            case 36:
                array.append(.History)
            case 27:
                array.append(.Horror)
            case 10402:
                array.append(.Music)
            case 9648:
                array.append(.Mystery)
            case 10749:
                array.append(.Romance)
            case 878:
                array.append(.ScienceFiction)
            case 10770:
                array.append(.TVMovie)
            case 53:
                array.append(.Thriller)
            case 10752:
                array.append(.War)
            default:
                array.append(.Western)
                
            }
        }
        return array
    }
}
