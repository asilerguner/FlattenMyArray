//
//  FlattenMyArrayTests.swift
//  FlattenMyArrayTests
//
//  Created by Asil Erguner on 2018-01-12.
//  Copyright © 2018 Asil Erguner. All rights reserved.
//

import XCTest
@testable import FlattenMyArray

class FlattenMyArrayTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        let flattenedIntegerArray: [Any] = [1, [2, 3, 4, 5, 6, 7], 8].flattenedArray
        XCTAssertEqual([1, 2, 3, 4, 5, 6, 7, 8], flattenedIntegerArray as! [Int])
        
        let flattenedStringArray: [Any] = ["login",["recover",["password","username"]],[[[[["secret"]]]]]].flattenedArray
        XCTAssertEqual(["login", "recover", "password", "username", "secret"], flattenedStringArray as! [String])
        
        let flattenedAnyArray = [0,["recover",["password","username"]],[[[[[1]]]]]].flattenedArray
        let flattenedAnytoStringArray = String(describing: flattenedAnyArray)
        XCTAssertEqual(String(describing: [0, "recover", "password", "username", 1]), flattenedAnytoStringArray)
    }
      
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
