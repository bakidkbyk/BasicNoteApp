//
//  ResponseData.swift
//  DataProvider
//
//  Created by Baki Dikbıyık on 23.08.2023.
//

public struct ResponseData: Codable {
    
    public let accessToken: String?
    public let tokenType: String?
    
    enum CodingKeys: String, CodingKey {
       case accessToken = "access_token"
       case tokenType = "token_type"
    }
}
