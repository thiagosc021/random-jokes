//
//  ChuckNorrisAPI.swift
//  Joker
//
//  Created by Thiago Costa on 3/4/22.
//

import Foundation
import FileProvider

public actor ChuckNorrisAPI: JokersAPI {
    
    enum Category: CaseIterable {
        case animal
        case career
        case celebrity
        case dev
        case fashion
        case food
        case history
        case money
        case movie
        case music
        case political
        case religion
        case science
        case sport
        case travel
    }
    
    private var urlComponents: URLComponents {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.chucknorris.io"
        components.path = "/jokes/random"
        return components
    }
    
    private func URL(for jokeCategory: Category) -> URL {
        var components = urlComponents
        components.setQueryItems(with: ["category": "\(jokeCategory)"])
        return components.url!
    }
    
    public func loadJokes() async throws -> [Joke] {
        var jokes:[Joke] = []
        
        for jokeCategory in Category.allCases {
            let (data, response) = try await URLSession.shared.data(from: URL(for: jokeCategory))
            
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                      throw DownloadError.statusNotOk
            }
            
            do {
                #if TEST || DEBUG
                print(String(data: data, encoding: .utf8)!)
                #endif
                
                let chuckNorrisJoke = try JSONDecoder().decode(ChuckNorrisJoke.self, from: data)
                
                let joke = Joke(style: .ChuckNorris, id: chuckNorrisJoke.id, setup: chuckNorrisJoke.value, punchLine: "", isFavorite: false)
                
                jokes.append(joke)
                
            } catch let error {
                print(error)
                throw DownloadError.decoderError
            }
        }
        return jokes
    }
}

struct ChuckNorrisJoke: Decodable {
    var id: String
    var value: String
}
