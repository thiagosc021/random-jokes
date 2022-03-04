//
//  ChuckNorrisAPIMock.swift
//  Joker
//
//  Created by Thiago Costa on 3/4/22.
//

import Foundation


public actor ChuckNorrisAPIMock: JokersAPI {
    
    public init() {}
    
    public func loadJokes() async throws -> [Joke] {
        var jokes:[Joke] = []
        
        let jsonList = [jsonJoke1, jsonJoke2, jsonJoke3]
        
        for json in jsonList {
            do {
                let chuckNorrisJoke = try JSONDecoder().decode(ChuckNorrisJoke.self, from: json!)
                let joke = Joke(style: .ChuckNorris, id: chuckNorrisJoke.id, setup: chuckNorrisJoke.value, punchLine: "", isFavorite: false)
                
                jokes.append(joke)
                
            } catch let error {
                print(error)
                throw DownloadError.decoderError
            }
        }
        
        return jokes
    }
    
    private let jsonJoke1 = """
    {"categories":["animal"],"created_at":"2020-01-05 13:42:19.576875","icon_url":"https://assets.chucknorris.host/img/avatar/chuck-norris.png","id":"9ovbd5b1t66_x92jwrq1yq","updated_at":"2020-01-05 13:42:19.576875","url":"https://api.chucknorris.io/jokes/9ovbd5b1t66_x92jwrq1yq","value":"Chuck Norris once rode a bull, and nine months later it had a calf."}
    """.data(using: .utf8)
    
    private let jsonJoke2 = """
       {"categories":["career"],"created_at":"2020-01-05 13:42:19.104863","icon_url":"https://assets.chucknorris.host/img/avatar/chuck-norris.png","id":"3y7vnqsvtvuvvmhtuqjuma","updated_at":"2020-01-05 13:42:19.104863","url":"https://api.chucknorris.io/jokes/3y7vnqsvtvuvvmhtuqjuma","value":"Chuck Norris' first job was as a paperboy. There were no survivors."}
    """.data(using: .utf8)
    
    private let jsonJoke3 = """
    {"categories":["celebrity"],"created_at":"2020-01-05 13:42:18.823766","icon_url":"https://assets.chucknorris.host/img/avatar/chuck-norris.png","id":"iDINmgz-RuuY715ky4KIFQ","updated_at":"2020-01-05 13:42:18.823766","url":"https://api.chucknorris.io/jokes/iDINmgz-RuuY715ky4KIFQ","value":"Chuck Norris smoked charlie sheen to get a high,an still couldn't catch a buzz."}
    """.data(using: .utf8)
}
