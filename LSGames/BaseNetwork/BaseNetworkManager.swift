//
//  BaseNetworkManager.swift
//  LSGames
//
//  Created by Can Yoldaş on 20.05.2022.
//

import Foundation

protocol NetworkManagerProtocol {
    
    func sendRequest<R: Codable>(urlRequest: URLRequest, completion: @escaping (Result<R, ErrorResponse>) -> Void)
}


class BaseNetworkManager: NetworkManagerProtocol {
    
    static let shared = BaseNetworkManager()
    
    private let session: URLSession
    private var jsonDecoder = JSONDecoder()
    
    init() {
        let config = URLSessionConfiguration.default
        config.waitsForConnectivity = true
        config.timeoutIntervalForResource = 350
        config.requestCachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        self.session = URLSession(configuration: config)
    }
    
    func sendRequest<R>(urlRequest: URLRequest, completion: @escaping (Result<R, ErrorResponse>) -> Void) where R: Codable {
        
        session.dataTask(with: urlRequest) { (data, urlResponse, error) in
            self.dataTaskHandler(data, urlResponse, error, completion: completion)
            guard let data = data else {return}
            
            print("data: \(String(decoding: data, as: UTF8.self))")
        }.resume()
        
    }
    
    private func dataTaskHandler<R: Codable>(_ data: Data?, _ response: URLResponse?, _ error: Error?, completion: @escaping (Result<R, ErrorResponse>) -> Void) {
        
        if error != nil {
            completion(.failure(
                ErrorResponse(
                    serverResponse: ServerResponse(
                        returnMessage: error!.localizedDescription,
                        returnCode: error!._code),
                    apiConnectionErrorType: .serverError(error!._code))))
        }
        
        if let data = data {
            do {
                let decodedData = try jsonDecoder.decode(R.self, from: data)
                completion(.success(decodedData))
            } catch let error {
                completion(.failure(
                    ErrorResponse(serverResponse: ServerResponse(
                        returnMessage: error.localizedDescription,
                        returnCode: error._code),
                                  apiConnectionErrorType: .dataDecodedFailed(error.localizedDescription))))
            }
        }
    }
}
