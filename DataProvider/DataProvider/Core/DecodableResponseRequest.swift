//
//  DecodableResponseRequest.swift
//  DataProvider
//
//  Created by Baki Dikbıyık on 4.08.2023.
//

import Foundation

public protocol DecodableResponseRequest: RequestProtocol {
    associatedtype ResponseType: Decodable
}
