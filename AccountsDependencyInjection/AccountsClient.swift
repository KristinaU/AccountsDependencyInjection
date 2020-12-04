//
//  AccountsClient.swift
//  AccountsDependencyInjection
//
//  Created by The App Experts on 02/12/2020.
//  Copyright © 2020 The App Experts. All rights reserved.
//

import Foundation

class AccountsClient {
    
    let urlString = "https://my-json-server.typicode.com/KristinaU/AccountsDependencyInjection/accounts"
    var accountsArray: [AccountsModel] = []
    var titlesArray: [String] = []
    var arrayCompletion = false
    
    func parse(jsonData: Data) -> Void {
        
        let decoder = JSONDecoder()
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
            }

        }
        task.resume()
    }

    func load() {

        let semaphore = DispatchSemaphore(value: 0)

        self.loadJson(fromURLString: self.urlString) { (result) in
            switch result {
            case .success(let data):
                self.parse(jsonData: data)
                self.arrayCompletion = true

            case .failure(let error):
                print(error)
            }
            semaphore.signal()
        }
        _ = semaphore.wait(wallTimeout: .distantFuture)
    }

}
