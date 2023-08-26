//
//  Data.swift
//  DataProvider
//
//  Created by Baki Dikbıyık on 26.08.2023.
//

public struct Data: Decodable {
    public let accessToken: String
    public let tokenType: String
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case tokenType = "token_type"
    }
}
