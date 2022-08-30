//
//  NetworkService.swift
//  Movve
//
//  Created by Fed on 30.08.2022.
//

import Foundation

final class NetworkService {
    
    // swiftlint:disable line_length
    let urlMovie = "https://api.themoviedb.org/3/discover/movie?api_key=7822759433d26b0333c1c26e943ac26f&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate"
    private let urlTvShow = "https://api.themoviedb.org/3/discover/tv?api_key=7822759433d26b0333c1c26e943ac26f&language=en-US&sort_by=popularity.desc&page=1&timezone=America%2FNew_York&include_null_first_air_dates=false&with_watch_monetization_types=flatrate&with_status=0&with_type=0"
    // swiftlint:enable line_length
    
    private let queue = DispatchQueue(label: "ru.teodor.Movve - NetworkService")
    
    func fetchPopularMovies(with urlString: String, completion: @escaping (Result<NetworkMovieModel, Error>) -> Void) {
        queue.async {
            self.performRequest(with: urlString) { result in
                switch result {
                case .success(let data):
                    guard let decodedData = try? JSONDecoder().decode(NetworkMovieModel.self, from: data) else {
                        return completion(.failure(NetworkError.decodingError))
                    }
                    DispatchQueue.main.async {
                        completion(.success(decodedData))
                    }
                case .failure:
                    DispatchQueue.main.async {
                        completion(.failure(NetworkError.requestError))
                    }
                }
            }
        }
    }
    
    func fetchPopularTV(with: URL?) {
        queue.async {
        }
        
    }
    
    private func performRequest(with path: String, completion: @escaping (Result<Data, NetworkError>) -> Void) {
        queue.async {
            guard let url = URL(string: path) else {
                return completion(.failure(NetworkError.urlError))
            }
            let urlSession = URLSession(configuration: .default)
            urlSession.dataTask(with: url) { data, _, error in
                guard error == nil else {
                    return completion(.failure(NetworkError.sessionError))
                }
                guard let data = data else {
                    return completion(.failure(NetworkError.sessionError))
                }
                completion(.success(data))
            }.resume()
        }
    }
}
