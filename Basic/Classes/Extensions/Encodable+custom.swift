//
//  Encodable+custom.swift
//  71stStreet Ali
//
//  Created by Yasir Ali on 11/04/2018.
//  Copyright © 2018 Yasir Ali. All rights reserved.
//

import Foundation

extension Encodable{
    public var jsonEncodedData: Data? {
        return try? JSONEncoder().encode(self)
    }
    
    public var json: [String:Any] {
        guard let data =  jsonEncodedData else {
            return [:]
        }
        guard let jsonObject = try? JSONSerialization.jsonObject(with: data, options: [])  else {
            return [:]
        }
        guard let dictionary =  jsonObject as? [String:Any] else {
            return [:]
        }
        return dictionary
    }
}
