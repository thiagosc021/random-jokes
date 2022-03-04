//
//  DaddysAPIMock.swift
//  Joker
//
//  Created by Thiago Costa on 3/4/22.
//

import Foundation


public actor DaddysAPIMock: JokersAPI {
    
    public init() {}
    
    public func loadJokes() async throws -> [Joke] {
        var jokes:[Joke] = []
        
        let jsonList = [jokeJson1,jokeJson2,jokeJson3]
        
        for json in jsonList {
            
            do {
                
                let jsonJoke = try JSONDecoder().decode(JSONJoke.self, from: json!)
                
                guard let body = jsonJoke.body.first else { return jokes }

                let joke = Joke(style: .Daddys, id: body.id, setup: body.setup, punchLine: body.punchline, isFavorite: false)

                jokes.append(joke)
            } catch let error {
                print(error)
                throw DownloadError.decoderError
            }
            
        }
        
        return jokes
    }
    
    private let jokeJson1 = """
        {"success":true,"body":[{"_id":"60dd35f67365833651bba40c","setup":"What organ in the body never dies?","punchline":"THE LIVER. ometrist will copyright this joke. hopefully.","type":"copyright","likes":[],"author":{"name":"unknown","id":null},"approved":true,"date":1618108661,"NSFW":false}]}
    """.data(using: .utf8)
    
    private let jokeJson2 = """
        {"success":true,"body":[{"_id":"60dd35f67365833651bba40c","setup":"What organ in the body never dies?","punchline":"THE LIVER. ometrist will copyright this joke. hopefully.","type":"copyright","likes":[],"author":{"name":"unknown","id":null},"approved":true,"date":1618108661,"NSFW":false}]}
    """.data(using: .utf8)
    
    private let jokeJson3 = """
        {"success":true,"body":[{"_id":"60dd35f67365833651bba40c","setup":"What organ in the body never dies?","punchline":"THE LIVER. ometrist will copyright this joke. hopefully.","type":"copyright","likes":[],"author":{"name":"unknown","id":null},"approved":true,"date":1618108661,"NSFW":false}]}
    """.data(using: .utf8)
    
}
