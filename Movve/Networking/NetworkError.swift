//
//  NetworkError.swift
//  Movve
//
//  Created by Fed on 30.08.2022.
//

import Foundation

enum NetworkError: Error {
    case urlError
    case requestError
    case sessionError
    case decodingError
}
