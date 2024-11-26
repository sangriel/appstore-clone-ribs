//
//  DefaultNetworkService.swift
//  AppStoreRibs
//
//  Created by sangmin han on 11/24/24.
//

import Foundation
import Combine



final class DefaultNetworkService : NetworkService {
    func request<T>(endPoint: T) -> AnyPublisher<T.Response, any Error> where T : EndPoints {
        guard let url = URL(string: endPoint.baseUrl + endPoint.path) else {
            return Fail(error: NetworkError.invalidURL).eraseToAnyPublisher()
        }
        
        var urlRequest = URLRequest(url: url)
        
        if endPoint.method == .GET || endPoint.method == .DELETE {
            var queryItems : [URLQueryItem] = []
            for (key,value) in endPoint.parameter ?? [:] {
                let queryItem = URLQueryItem(name: key, value: "\(value)" )
                queryItems.append(queryItem)
            }
        }
        else {
            do {
                let jsonData = try JSONSerialization.data(withJSONObject: endPoint.parameter ?? [:])
                urlRequest.httpBody = jsonData
            }
            catch(let error) {
                print("\(error.localizedDescription)")
                return Fail(error: NetworkError.requestFailed("Encoding Body Parameter failed")).eraseToAnyPublisher()
            }
        }
        
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .tryMap{ (data,response) -> Data in
                if let httpResponse = response as? HTTPURLResponse, (200...300).contains(httpResponse.statusCode) {
                    return data
                }
                else {
                    let statusCode = (response as? HTTPURLResponse)?.statusCode ?? -1
                    throw NetworkError.requestFailed("Request failed with statusCode \(statusCode)")
                }
            }
            .decode(type: T.Response.self, decoder: JSONDecoder())
            .tryMap { (response)  in
                return response
            }
            .mapError { error -> NetworkError in
                if error is DecodingError {
                    return NetworkError.decodingFailed
                }
                else if let networkError = error as? NetworkError {
                    return networkError
                }
                else {
                    return NetworkError.requestFailed("Request failed with unknown error")
                }
            }
            .eraseToAnyPublisher()
    }
}


