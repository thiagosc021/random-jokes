//
//  JokerTests.swift
//  JokerTests
//
//  Created by Thiago Costa on 3/4/22.
//

import XCTest

@testable import Joker


class JokerServiceTests: XCTestCase {

    let chuckNorrisAPI = ChuckNorrisAPIMock()
    let daddysJokeAPI = DaddysAPIMock()
    
    func testLoadJokesFromChuckNorrisAPI() async throws {
        let result = try await loadJokesForTest(jokeStyle: .ChuckNorris)
        print(result)
    }
    
    func testLoadJokesFromDaddysJokeAPI() async throws {
        let result = try await loadJokesForTest(jokeStyle: .Daddys)
        print(result)
    }

}

private extension JokerServiceTests {
    func loadJokesForTest(jokeStyle: JokeStyle) async throws -> [Joke] {
        let service = JokerService(chuckNorrisAPI: chuckNorrisAPI, daddysJokeAPI: daddysJokeAPI)
    
        let result = try await service.fetchJoke(for: .ChuckNorris)
        
        return result
    }
}
