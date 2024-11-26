//
//  NetworkService.swift
//  AppStoreRibs
//
//  Created by sangmin han on 11/24/24.
//

import Foundation
import Combine

protocol NetworkService {
    func request<T : Decodable>(endPoint : EndPoints) -> AnyPublisher<T,Error>
}
