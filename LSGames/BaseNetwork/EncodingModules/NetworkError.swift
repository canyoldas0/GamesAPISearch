//
//  NetworkError.swift
//  MovieDiary
//
//  Created by Can Yoldas on 3.12.2021.
//

import Foundation

public enum NetworkError: String, Error {
    case parametersNil = "Parameters were nil."
    case encodingFailed = "Parameter encoding failed."
    case missingURL = "URL is nil."
}
