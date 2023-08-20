//
//  DataProvider.swift
//  BasicNoteApp
//
//  Created by Baki Dikbıyık on 20.08.2023.
//

import Foundation

let apiDataProvider = APIDataProvider(interceptor: APIRequestInterceptor.shared, eventMonitors: [])
