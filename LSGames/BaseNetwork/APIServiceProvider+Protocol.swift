//
//  APIServiceProvider.swift
//  MovieDiary
//
//  Created by Can Yoldas on 3.12.2021.
//

import Foundation

protocol URLRequestProtocol {
    func returnUrlRequest() throws -> URLRequest
}

class ApiServiceProvider<T: Codable>: URLRequestProtocol {
    
    private var method: HTTPMethod
    private var baseUrl: String
    private var path: String?
    private var data: T?
    
    public init(method: HTTPMethod = .get,
                baseUrl: String,
                path: String? = nil,
                data: T? = nil
    ) {
        
        self.method = method
        self.baseUrl = baseUrl
        self.path = path
        self.data = data
    }
    
     func returnUrlRequest() throws -> URLRequest {
        
        var url = try baseUrl.asURL()
        
        if let path = path {
            url = url.appendingPathComponent(path)
        }
         
         let apiHeaders = [
             "x-rapidapi-host": "wft-geo-db.p.rapidapi.com",
             "x-rapidapi-key": "ca570ed80amsh0037ada6c8e41bfp1892b4jsne656da8543f3"
         ]
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.headers = headers
        request.allHTTPHeaderFields = apiHeaders
        
        try configureEncoding(request: &request)
        
        return request
    }
    
    private func configureEncoding(request: inout URLRequest) throws {
        switch method {
        case .post, .put:
            try ParameterEncoding.jsonEncoding.encode(urlRequest: &request, parameters: params)
        case .get:
            try ParameterEncoding.urlEncoding.encode(urlRequest: &request, parameters: params)
        default:
            try ParameterEncoding.urlEncoding.encode(urlRequest: &request, parameters: params)
        }
    }
    
    private var params: Parameters? {
        return data.asDictionary()
    }
    
    private var headers: HTTPHeaders {
        var httpHeaders = HTTPHeaders()
        httpHeaders.add(HTTPHeader(name: HTTPHeaderFields.contentType.value.0, value: HTTPHeaderFields.contentType.value.1))
        return httpHeaders
    }
    
}
