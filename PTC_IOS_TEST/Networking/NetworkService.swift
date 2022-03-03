//
//  NetworkService.swift
//  PTC_IOS_TEST
//
//  Created by Rangel Cardoso Dias on 28/02/22.
//  Copyright © 2022 Jumia. All rights reserved.
//

import Foundation

enum NetworkResult<T> {
    case success(T?)
    case error(Error?)
}

/// Defines generic request service
protocol NetworkService {
    associatedtype Target: NetworkTarget
    typealias ServiceCompletion<T> = (NetworkResult<T>) -> Void
    
    func request<T: Decodable>(target: Target, then complete: @escaping ServiceCompletion<T>)
    func request(target: Target, then complete: @escaping ServiceCompletion<Void>)
}

extension NetworkService {
    
    private var provider: URLSession {
        return URLSession.shared
    }
    
    func request<T: Decodable>(target: Target, then complete: @escaping ServiceCompletion<T>) {
        provider.dataTask(with: createRequest(target)) { (responseData, response , error) in
            if let error = error {
                complete(.error(error))
                return
            }
            
            guard let data = responseData else {
                complete(.success(nil))
                return
            }
            
            let result = try? T.decode(from: data)
            complete(.success(result))
        }.resume()
    }
    
    func request(target: Target, then complete: @escaping ServiceCompletion<Void>) {
        provider.dataTask(with: createRequest(target)) { (responseData, response, error) in
            if let error = error {
                complete(.error(error))
                return
            }
            complete(.success(nil))
        }.resume()
    }
    
    private func createRequest(_ target: Target) -> URLRequest{
        let url = target.baseURL.appendingPathComponent(target.path)
        var urlComp = URLComponents(string: url.absoluteString)
        urlComp?.queryItems = []
        if let header = target.header {
            for parameter in header{
                urlComp?.queryItems?.append(URLQueryItem(name: parameter.key, value: parameter.value))
            }
        }
        var request = URLRequest(url: urlComp?.url ?? url)
        request.httpMethod = target.method.rawValue
        request.allHTTPHeaderFields = target.header
        return request
    }
}
