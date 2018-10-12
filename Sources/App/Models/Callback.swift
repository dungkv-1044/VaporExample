//
//  Callback.swift
//  App
//
//  Created by khuat.van.dung on 10/12/18.
//

import Vapor

struct Callback: Content {
    var message: String
    var statusCode: UInt
}
