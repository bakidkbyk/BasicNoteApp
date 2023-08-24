//
//  Auth.swift
//  DataProvider
//
//  Created by Baki Dikbıyık on 23.08.2023.
//

public struct Auth: Decodable {
    public let code: String?
    public let data: ResponseData
    public let message: String?
}
