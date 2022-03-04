//
//  JokerAPI.swift
//  randomJokes
//
//  Created by Thiago Costa on 3/1/22.
//

import Foundation

public protocol JokerServiceProtocol {
    func fetchJoke(for: JokeStyle) async throws -> [Joke]
    func saveJoke(joke: Joke) async throws
    func deleteJoke(joke: Joke) async throws
}

public protocol JokersAPI {
    func loadJokes() async throws -> [Joke]
}

public enum DownloadError: Error {
  case statusNotOk
  case decoderError
}

public class JokerService: JokerServiceProtocol {
    private let chuckNorrisAPI: JokersAPI
    private let daddysJokeAPI: JokersAPI
    
    @MainActor
    public func fetchJoke(for jokeStyle: JokeStyle) async throws -> [Joke] {
        switch jokeStyle {
        case .ChuckNorris:
            return try await chuckNorrisAPI.loadJokes()
        case .Daddys:
            return try await daddysJokeAPI.loadJokes()
        }
    }
    
    public func saveJoke(joke: Joke) async throws {
    }
    
    public func deleteJoke(joke: Joke) async throws {
    }
    
    public init(chuckNorrisAPI: JokersAPI, daddysJokeAPI: JokersAPI) {
        self.chuckNorrisAPI = chuckNorrisAPI
        self.daddysJokeAPI = daddysJokeAPI
    }
}

public extension URLComponents {
  /// Maps a dictionary into `[URLQueryItem]` then assigns it to the
  /// `queryItems` property of this `URLComponents` instance.
  /// From [Alfian Losari's blog.](https://www.alfianlosari.com/posts/building-safe-url-in-swift-using-urlcomponents-and-urlqueryitem/)
  /// - Parameter parameters: Dictionary of query parameter names and values
  mutating func setQueryItems(with parameters: [String: String]) {
    self.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
  }
}


