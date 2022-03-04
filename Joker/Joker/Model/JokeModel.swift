//
//  JokeModel.swift
//  randomJokes
//
//  Created by Thiago Costa on 3/1/22.
//

import Foundation

public enum JokeStyle {
    case ChuckNorris
    case Daddys
    
    var API_URL: String {
        switch self {
        case .ChuckNorris:
            return ""
        case .Daddys:
            return ""
        }
    }
}

public struct Joke {
    var style: JokeStyle
    var id: String
    var setup: String
    var punchLine: String
    var isFavorite: Bool
}

