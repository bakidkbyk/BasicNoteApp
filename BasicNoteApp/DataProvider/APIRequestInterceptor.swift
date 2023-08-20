//
//  APIRequestInterceptor.swift
//  BasicNoteApp
//
//  Created by Baki Dikbıyık on 20.08.2023.
//

import Alamofire
import KeychainSwift

public class APIRequestInterceptor: RequestInterceptor {
    
    public static let shared = APIRequestInterceptor()
    
    public func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        let urlRequest = urlRequest
        
        completion(.success(urlRequest))
    }
}
