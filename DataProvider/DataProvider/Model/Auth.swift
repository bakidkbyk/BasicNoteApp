//
//  Auth.swift
//  DataProvider
//
//  Created by Baki Dikbıyık on 26.08.2023.
//

public struct Auth: Decodable {
    public let code: String?
    public let data: Data?
    public let message: String?
}
