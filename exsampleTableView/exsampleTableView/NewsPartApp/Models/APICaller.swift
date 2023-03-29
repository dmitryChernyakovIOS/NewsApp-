//
//  APICaller.swift
//  exsampleTableView
//
//  Created by Дмитрий Богданович on 20.03.23.
//

import Foundation


final class APICaller {
    static let shared = APICaller()
    // Struct: Constants
    struct Constants {
        static let topHeadlinesURL = URL(
             string: "https://newsapi.org/v2/everything?q=Apple&from=2023-03-06&sortBy=popularity&apiKey=a3e71ea2b9f1420d8b1b05e22da9a9be"
        )
        static let searchURLString =  "https://newsapi.org/v2/everything?q=Apple&from=2023-03-06&sortBy=popularity&apiKey=a3e71ea2b9f1420d8b1b05e22da9a9be"
    }
    private init() {}
    

    public func getTopStories(completion: @escaping (Result<[Article],Error>) -> Void){
        guard let url = Constants.topHeadlinesURL else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                print(error.localizedDescription)
            }
            else if let data = data {
                do {
                    let result = try JSONDecoder().decode(APIResponse.self, from: data)
                    completion(.success(result.articles))
                    
                }
                catch{
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
    
    public func search(with query: String, completion: @escaping (Result<[Article],Error>) -> Void){
        guard !query.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }
        let urlString = Constants.searchURLString + query
        guard  let url = URL(string: urlString) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
            }
            else if let data = data{
                do {
                    let result = try JSONDecoder().decode(APIResponse.self, from: data)
                    completion(.success(result.articles))
                } catch {
                    print(error)
                }
            }
        }
        task.resume()
    }
}
