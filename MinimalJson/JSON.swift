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
    
    let rootObject: AnyObject
    
    // Failable initialiser (i.e return nil if JSON containted in NSData object is invalid)
    init?(data: NSData) {
        var error: NSError?
        if let object: AnyObject = NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments, error: &error) {
            rootObject = object
        } else {
            rootObject = [:]
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

//extension JSON {
//    subscript(hash: String) -> JSON {
//
//    }
//}

/**
*  Value support
*/

extension JSON {
    func string() -> String? {
        return rootObject as? String
    }
    
    func int() -> Int? {
        return rootObject as? Int
    }
    
    func bool() -> Bool? {
        if let i = rootObject as? Int {
            return Bool(i)
        } else {
            return nil
        }
    }
    
    //    func array() -> Array? {
    //        return rootObject as? Array
    //    }
    
}
