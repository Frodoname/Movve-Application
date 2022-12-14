//
//  DtoTransformer.swift
//  Movve
//
//  Created by Fed on 30.08.2022.
//

import Foundation

final class DtoTransformer {
    
    private let imagePath = "https://image.tmdb.org/t/p/w300"
    private let originalImagePath = "https://image.tmdb.org/t/p/w500"
    
    private func networkMovieToDomain(with movieModel: ElementMovie) -> ItemModel {
        let model = ItemModel(name: movieModel.title,
                              id: movieModel.id,
                              description: movieModel.overview,
                              rate: movieModel.voteAverage,
                              date: movieModel.releaseDate,
                              image: (imagePath + movieModel.posterPath),
                              originalImage: (originalImagePath + movieModel.posterPath),
                              originalLanguage: movieModel.originalLanguage,
                              popularity: movieModel.popularity,
                              genreId: movieModel.genreIDS)
        return model
    }
    
    func networkMovieToDomainArray(with array: [ElementMovie]) -> [ItemModel] {
        return array.map { networkMovieToDomain(with: $0) }
    }
    
    private func networkTvToDomain(with tvModel: ElementTv) -> ItemModel {
        let model = ItemModel(name: tvModel.name,
                              id: tvModel.id,
                              description: tvModel.overview,
                              rate: tvModel.voteAverage,
                              date: tvModel.firstAirDate,
                              image: (imagePath + tvModel.posterPath),
                              originalImage: (originalImagePath + tvModel.posterPath),
                              originalLanguage: tvModel.originalLanguage,
                              popularity: tvModel.popularity,
                              genreId: tvModel.genreIDS)
        return model
    }
    
    func networkTvToDomainArray(with array: [ElementTv]) -> [ItemModel] {
        return array.map { networkTvToDomain(with: $0) }
    }
}
