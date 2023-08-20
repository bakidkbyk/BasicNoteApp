//
//  DataProviderResult.swift
//  DataProvider
//
//  Created by Baki Dikbıyık on 4.08.2023.
//

import Foundation

public typealias DataProviderResult<T: Decodable> = ((Result<T, Error>) -> Void)

public protocol DataProviderProtocol {
    func request<T: DecodableResponseRequest>(for request: T,
                                              result: DataProviderResult<T.ResponseType>?)
    
}
