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

public class MinimalJSON {
    
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

extension MinimalJSON {
    
    subscript(hash: String) -> MinimalJSON {
        if let dictionary = rootObject as? Dictionary<String, AnyObject> {
            if let object: AnyObject = dictionary[hash] {
                return MinimalJSON(object: object)
            } else {
                return MinimalJSON(object: NSNull())
            }
        } else {
            return MinimalJSON(object: NSNull())
        }
    }
    
    subscript(index: Int) -> MinimalJSON {
        if let array = rootObject as? Array<AnyObject> {
            if (index >= 0) && (index < array.count) {
                return MinimalJSON(object: array[index])
            } else {
                return MinimalJSON(object: NSNull())
            }
        } else {
            return MinimalJSON(object: NSNull())
        }
    }
}

/**
*  Value support
*/

extension MinimalJSON {

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
        if let i = rootObject as? Int {
            if i >= 0 {
                return UInt(i)
            } else {
                return nil
            }
        } else {
            return nil
        }
    }
    
    var float: Float? {
        return rootObject as? Float
    }
    
    var double: Double? {
        return rootObject as? Double
    }
}
