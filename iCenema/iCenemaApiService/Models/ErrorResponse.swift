//
//  ErrorResponse.swift
//  iCenema
//
//  Created by youcef hedibel on 10/12/2023.
//

import Foundation
//test
public struct ErrorResponse: Decodable {
    public let code: Int
    public let message: String
    
    public init(code: Int, message: String) {
        self.code = code
        self.message = message
    }
}
