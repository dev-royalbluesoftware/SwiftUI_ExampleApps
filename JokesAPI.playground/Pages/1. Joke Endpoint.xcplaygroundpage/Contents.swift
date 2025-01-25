//: [Previous](@previous)

import Foundation

// MARK: - MODEL STRUCT

struct Joke: Codable {
    let id: Int
    let category: Category
    let type: JokeType
    let lang: Language
    let setup: String?
    let delivery: String?
    let joke: String?
}

enum Category: String, Codable, CaseIterable, Identifiable {
    case `Any`
    case Programming
    case Misc
    case Dark
    case Pun
    case Spooky
    case Christmas
    
    var id: Self { self }
}

enum Language: String, Codable, CaseIterable, Identifiable {
    case en
    case fr
    case cs
    case de
    case es
    case pt
    
    var id: Self { self }
}

enum JokeType: String, Codable {
case twopart
case single
}

class APIService {
    
    // MARK: - URL String Property
    let urlString: String
    
    // MARK: - Initializer
    init(urlString: String) { self.urlString = urlString }
    
    // MARK: - GetData Function
    
    func getData() async throws(APIError) -> Joke {
        guard let url = URL(string: urlString) else {
            throw .invalidURL
        }
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200
            
            else {
                throw APIError.invalidResponseStatus
            }
            
            // valid data
            let decoder = JSONDecoder()
            do {
                let decodedData = try decoder.decode(Joke.self, from: data)
                return decodedData
                
            } catch {
                throw APIError.decodingError(error.localizedDescription)
            }
        } catch {
            throw .dataTaskError(error.localizedDescription)
        }
    }
}

enum APIError: Error, LocalizedError {
    case invalidURL
    case dataTaskError(String)
    case invalidResponseStatus
    case decodingError(String)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            NSLocalizedString("The endpoint URL is invalid.", comment: "")
            
        case .dataTaskError(let messageString):
            messageString
            
        case .invalidResponseStatus:
            NSLocalizedString("The API failed to issue a valid HTTP response.", comment: "")
            
        case .decodingError(let messageString):
            messageString
        }
    }
}

/*
 Possible Endpoints
 Any category, English
 https://v2.jokeapi.dev/joke/Any?blacklistFlags=nsfw,religious,political,racist,sexist,explicit
 
 Single category, English
 https://v2.jokeapi.dev/joke/Programming?blacklistFlags=nsfw,religious,political,racist,sexist,explicit
 
 Any Category, language other than english
 https://v2.jokeapi.dev/joke/Any?lang=fr&blacklistFlags=nsfw,religious,political,racist,sexist,explicit
 
 Single Category, language other than english
 https://v2.jokeapi.dev/joke/Programming?lang=fr&blacklistFlags=nsfw,religious,political,racist,sexist,explicit
 */


func getJoke() async throws -> Joke {
    let urlString = "https://v2.jokeapi.dev/joke/Any?blacklistFlags=nsfw,religious,political,racist,sexist,explicit"
    let apiService = APIService(urlString: urlString)
    
    do {
        return try await apiService.getData()
        
    } catch {
        throw error
    }
}

Task {
    do {
        let joke = try await getJoke()
        print(joke.setup ?? "")
        print(joke.delivery ?? "")
        print(joke.joke ?? "")
        
    } catch {
        print(error.localizedDescription)
    }
}

//: [Next](@next)
