//
//  AccountsClient.swift
//  AccountsDependencyInjection
//
//  Created by The App Experts on 02/12/2020.
//  Copyright © 2020 The App Experts. All rights reserved.
//

import Foundation

protocol Decoding {

    func decode<T: Decodable>(_ type: T.Type, from data: Data) throws -> T
    
}

class MyDecoder: Decoding {
    
    private let decoder: JSONDecoder = JSONDecoder()
    
    func decode<T : Decodable>(_ type: T.Type, from data: Data) throws -> T {
        return try decoder.decode(type, from: data)
    }
}

class NetworkManager {
    
    func loadJson(fromURLString urlString: String,
                  completion: @escaping (Result<Data, Error>) -> Void) {

        let url = URL(string: urlString)
        guard let requestUrl = url else { fatalError() }

        var request = URLRequest(url: requestUrl)

        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in


            if let error = error {
                print("Error took place \(error)")
                completion(.failure(error))
            }


            if let response = response as? HTTPURLResponse {
                print("Response HTTP Status code: \(response.statusCode)")
            }


            if let data = data, let _ = String(data: data, encoding: .utf8) {
                completion(.success(data))
                print("Ok")
            }

        }
        task.resume()
    }
    
}

class AccountsClient {
    
    var accountsArray: [AccountsModel] = []
    var titlesArray: [String] = []
    var arrayCompletion = false
    
    var decoder: Decoding!
    
    var networkManager: NetworkManager!
    
    var urlString: String!
    
    func parse(jsonData: Data) -> Void {

        do {

            let accounts = try decoder.decode([AccountsModel].self, from: jsonData)

            for account in accounts {

                accountsArray.append(account)
                titlesArray.append(account.title + ": " + account.currency + " " + String(account.balance))

            }

        } catch {
            print("decode error")
        }
    }

    func load(completion: @escaping () -> Void) {

        self.networkManager.loadJson(fromURLString: self.urlString) { (result) in
            switch result {
            case .success(let data):
                print(data)
                self.parse(jsonData: data)

            case .failure(let error):
                print(error)
            }
            completion()
        }
    }

}
