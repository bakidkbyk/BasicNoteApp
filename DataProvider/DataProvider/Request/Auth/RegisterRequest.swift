//
//  RegisterRequest.swift
//  DataProvider
//
//  Created by Baki Dikbıyık on 23.08.2023.
//

public struct RegisterRequest: RequestProtocol {
    
    public typealias ResponseType = <#T##Type###>
    
    public var path: String = <#T##Type###>
    public var method: RequestMethod = <#T##Type###>
    public var parameters: RequestParameters = [:]
    public var headers: RequestHeaders = [:]
    
    public init() {}
    
}
