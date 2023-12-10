//
//  NetworkService.swift
//  iCenema
//
//  Created by youcef hedibel on 10/12/2023.
//

import UIKit
import Alamofire

open class NetworkService {
    public static var sharedNS = NetworkService()
    
    static let baseUrl: String = "https://api.themoviedb.org/3/"
    static let token: String = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1N2I2ODQyYWIwMWJjOWFlNjc1OWM4NmUzNzRjZDM4MiIsInN1YiI6IjY1NzRlYjlkN2EzYzUyMDE0ZTY5NDMxNyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.QcZfnCZ8-CfpdBYwLiMXzcLdat_lXmHrIU-TqnS3CwY"
    
    private var header: HTTPHeaders {
        get {
            return [
                "Authorization" : "Bearer \(NetworkService.token)"
            ]
        }
    }
    
    private let timout: Double = 15
    private let session = Session()

    public func get<Model: Decodable>(url: String, query: [String: Any]? = nil, success: @escaping (Model) -> Void, failed: @escaping (ErrorResponse?) -> Void){
        debugPrint("http:url: \(NetworkService.baseUrl)\(url)")
        
        session.request("\(NetworkService.baseUrl)\(url)", method: .get, parameters: query, encoding: URLEncoding.queryString, headers: header) { (urlRequest: inout URLRequest) in
            urlRequest.timeoutInterval = self.timout
        }.responseDecodable(of: Model.self) { response in
            
            debugPrint("http:res: \(response.debugDescription)")
            
            guard let status = response.response?.statusCode else {
                failed(ErrorResponse(code: 0, message: "somthing_went_wrong"))
                return
            }
            
            switch status {
            case 200...299:
                switch response.result {
                case .success(let res):
                    success(res)
                case .failure(let error):
                    failed(ErrorResponse(code: 0, message: error.errorDescription ?? ""))
                }
            case 400...499:
                guard let data = response.data, let error = try? JSONDecoder().decode(ErrorResponse.self, from: data) else {
                    failed(ErrorResponse(code: 0, message: "something_went_wrong"))
                    return
                }
                failed(error)
            default: failed(ErrorResponse(code: 0, message: "somthing_went_wrong"))
            }
        }
    }
}

