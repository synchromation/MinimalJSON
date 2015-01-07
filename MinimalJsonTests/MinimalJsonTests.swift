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
    
    var JSONData: NSData!
    
    override func setUp() {
        super.setUp()

        if let file = NSBundle(forClass: MinimalJsonTests.self).pathForResource("TwitterUserTimeline", ofType: "json") {
            JSONData = NSData(contentsOfFile: file)
        } else {
            XCTFail("Missing TwitterUserTimeline file")
        }
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        
        var parsedJSON = JSON(data: JSONData)
        
        XCTAssertNotNil(parsedJSON, "Pass")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
