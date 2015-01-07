//
//  MinimalJsonTests.swift
//  MinimalJsonTests
//
//  Created by Nick Banks on 07/01/2015.
//  Copyright (c) 2015 Synchromation. All rights reserved.
//

import UIKit
import XCTest

class MinimalJsonTests: XCTestCase {
    
    let defaultString = "Default"
    let defaultIntZero = 0
    let defaultInt = 9999
    let defaultDoubleZero = 0.0
    let defaultDouble = 9999.0


    var parsedJSON: JSON!
    
    override func setUp() {
        super.setUp()
        
        if let file = NSBundle(forClass: MinimalJsonTests.self).pathForResource("Test", ofType: "json") {
            if let data = NSData(contentsOfFile: file) {
                if let parsedData = JSON(data: data) {
                    self.parsedJSON = parsedData
                } else {
                    XCTFail("Failed to parse JSON from file")
                }
            } else {
                XCTFail("Failed to create NSData from JSON")
            }
        } else {
            XCTFail("Missing JSON file")
        }
    }
    
    func testBoolean() {
        var b1 = parsedJSON["missingkey"].bool
        XCTAssertNil (b1, "Doesn't return nil for missing key")
        
        var b2 = parsedJSON["booltrue"].bool ?? false
        XCTAssertTrue (b2, "Doesn't return true")
        
        var b3 = parsedJSON["boolfalse"].bool ?? true
        XCTAssertFalse (b3, "Doesn't return false")
    }
    
    func testString() {
        var s1 = parsedJSON["missingkey"].string ?? defaultString
        XCTAssertEqual (s1, defaultString, "Doesn't return nil for missing key")
        
        var s2 = parsedJSON["string"].string ?? defaultString
        XCTAssertEqual (s2, "test", "Doesn't return string")
        
        var s3 = parsedJSON["stringempty"].string ?? defaultString
        XCTAssertEqual (s3, "", "Doesn't return empty string")
    }
    
    func testInt() {
        var i1 = parsedJSON["missingkey"].int
        XCTAssertNil (i1, "Doesn't return nil for missing key")
        
        var i2 = parsedJSON["intzero"].int ?? defaultInt
        XCTAssertEqual (i2, defaultIntZero, "Doesn't return 0")
        
        var i3 = parsedJSON["intpositive"].int ?? defaultIntZero
        XCTAssertEqual (i3, defaultInt, "Doesn't return int value")
    }
    
    func testUnsignedInt() {
        var ui1 = parsedJSON["missingkey"].unsignedInt
        XCTAssertNil (ui1, "Doesn't return nil for missing key")
        
        var ui2 = parsedJSON["intzero"].unsignedInt ?? UInt(defaultInt)
        XCTAssertEqual (ui2, UInt(defaultIntZero), "Doesn't return 0")
        
        var ui3 = parsedJSON["intpositive"].unsignedInt ?? UInt(defaultIntZero)
        XCTAssertEqual (ui3, UInt(defaultInt), "Doesn't return int value")
        
        var ui4 = parsedJSON["intpositive"].unsignedInt
        XCTAssertNil (ui4, "Doesn't return nil for negative integer")
    }
    
    func testFloat() {
        var f1 = parsedJSON["missingkey"].float
        XCTAssertNil (f1, "Doesn't return nil for missing key")
        
        var f2 = parsedJSON["intzero"].float ?? Float(defaultDouble)
        XCTAssertEqual (f2, Float(defaultDoubleZero), "Doesn't return 0.0")
        
        var f3 = parsedJSON["intpositive"].int ?? defaultIntZero
        XCTAssertEqual (f3, defaultInt, "Doesn't return int value")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
