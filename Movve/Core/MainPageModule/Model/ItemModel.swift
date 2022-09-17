//
//  MovieModel.swift
//  Movve
//
//  Created by Fed on 17.08.2022.
//

import Foundation

struct ItemModel {    
    let name: String
    let id: Int
    let description: String
    let rate: Double
    let date: String
    let image: String
    let originalImage: String
    let originalLanguage: String
    let popularity: Double
    let genreId: [Int]
    
    var dateFormatted: String {
        let dateFormatter = ISO8601DateFormatter()
        dateFormatter.formatOptions = [.withFullDate]
        guard let date = dateFormatter.date(from: date) else {
            return ""
        }
        let dateF = DateFormatter()
        dateF.dateFormat = "yyyy"
        return dateF.string(from: date)
    }
    
    var language: String {
        guard let language = Locale.init(identifier: "en").localizedString(forLanguageCode: originalLanguage) else {
            return ""
        }
        return language
    }
    
    var genre: String {
        var array: [Genre] = []
        for genre in genreId {
            switch genre {
            case 28:
                array.append(.action)
            case 12:
                array.append(.adventure)
            case 16:
                array.append(.animation)
            case 35:
                array.append(.comedy)
            case 80:
                array.append(.crime)
            case 99:
                array.append(.documentary)
            case 18:
                array.append(.drama)
            case 10751:
                array.append(.family)
            case 14:
                array.append(.fantasy)
            case 36:
                array.append(.history)
            case 27:
                array.append(.horror)
            case 10402:
                array.append(.music)
            case 9648:
                array.append(.mystery)
            case 10749:
                array.append(.romance)
            case 878:
                array.append(.scienceFiction)
            case 10770:
                array.append(.tvMovie)
            case 53:
                array.append(.thriller)
            case 10752:
                array.append(.war)
            case 10759:
                array.append(.actionAdventure)
            case 10762:
                array.append(.kids)
            case 10763:
                array.append(.news)
            case 10764:
                array.append(.reality)
            case 10765:
                array.append(.sciPiFantasy)
            case 10766:
                array.append(.soap)
            case 10767:
                array.append(.talk)
            case 10768:
                array.append(.warPolitics)
            case 37:
                array.append(.western)
            default:
                array.append(.noGenre)
            }
        }
        return array.map({$0.rawValue}).joined(separator: ", ")
    }
}
