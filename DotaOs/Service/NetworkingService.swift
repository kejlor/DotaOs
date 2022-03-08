//
//  NetworkingService.swift
//  DotaOs
//
//  Created by Bartosz Wojtkowiak on 08/03/2022.
//

import Foundation

enum RequestError: Error {
    case clientError
    case serverError
    case noData
    case dataDecodingError
}

class NetworkService {
    func makeUrlRequest<T: Any>(_ request: URLRequest, resultHandler: @escaping (Result<T, RequestError>) -> Void) {
        let urlTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard error == nil else {
                resultHandler(.failure(.clientError))
                return
            }

            guard let response = response as? HTTPURLResponse, 200...299 ~= response.statusCode else {
                resultHandler(.failure(.serverError))
                return
            }

            guard let data = data else {
                resultHandler(.failure(.noData))
                return
            }

            guard let decodedData: T = self.decodedData(data) else {
                resultHandler(.failure(.dataDecodingError))
                return
            }

            resultHandler(.success(decodedData))
        }

        urlTask.resume()
    }
    
    private func decodedData<T: Any>(_ data: Data) -> T? {
        if T.self is String.Type {
            return String(data: data, encoding: .utf8) as? T
        } else {
            return try? JSONSerialization.jsonObject(with: data) as? T
        }
    }
}
