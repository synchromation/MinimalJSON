//
//  JSON.swift
//  MinimalJson
//
//  Created by Nick Banks on 07/01/2015.
//  Copyright (c) 2015 Synchromation. All rights reserved.
//

import Foundation


/**
*  Main struct definition
*/

public class JSON {
    
    typealias JSONArray = Array<AnyObject>
    typealias JSONDictionary = Dictionary<String, AnyObject>
    
    let rootObject: AnyObject
    
    // Failable initialiser (i.e return nil if JSON containted in NSData object is invalid)
    init?(data: NSData) {
        var error: NSError?
        if let object: AnyObject = NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments, error: &error) {
            rootObject = object
        } else {
            rootObject = NSNull()
            return nil
        }
    }
    
    // Initializer for testing
    init (object: AnyObject) {
        rootObject = object
    }
}

/**
*  Subscript support
*/

extension JSON {
    
    subscript(hash: String) -> JSON {
        if let dictionary = rootObject as? Dictionary<String, AnyObject> {
            if let object: AnyObject = dictionary[hash] {
                return JSON(object: object)
            } else {
                return JSON(object: NSNull())
            }
        } else {
            return JSON(object: NSNull())
        }
    }
    
    subscript(index: Int) -> JSON {
        if let array = rootObject as? Array<AnyObject> {
            if (index >= 0) && (index < array.count) {
                return JSON(object: array[index])
            } else {
                return JSON(object: NSNull())
            }
        } else {
            return JSON(object: NSNull())
        }
    }
}

/**
*  Value support
*/

extension JSON {

    var array: JSONArray? {
        return rootObject as? JSONArray
    }
    
    var dictionary: JSONDictionary? {
        return rootObject as? JSONDictionary
    }
    
    var bool: Bool? {
        if let i = rootObject as? Int {
            if (i == 0) || (i == 1) {
                return Bool(i)
            } else {
                return nil
            }
        } else {
            return nil
        }
    }
    
    var string: String? {
        return rootObject as? String
    }
    
    var int: Int? {
        return rootObject as? Int
    }

    var unsignedInt: UInt? {
        return rootObject as? UInt
    }
    
    var float: Float? {
        return rootObject as? Float
    }
    
    var double: Double? {
        return rootObject as? Double
    }
}
