//
//  ProgrammerTest.swift
//  DataAndAlgorimTotalTests
//
//  Created by 9tong on 2020/2/21.
//  Copyright © 2020 liyuchen. All rights reserved.
//

import XCTest
@testable import DataAndAlgorimTotal

class ProgrammerTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testProgramerFalse(){
        
        let isUnique = Programmers.isUniqueChar(str: "SgW@uuoikm")
        XCTAssertFalse(isUnique)
    }
    
    func testProgramerTrue(){
          
        let isUnique = Programmers.isUniqueChar(str: "SgW@uoikm")
        XCTAssertTrue(isUnique)
    }

    
    func testStringReverse() {
        let str = Programmers.reverse(str: "bbgacc")
        
        XCTAssertEqual(str, "ccagbb")
    }
    
    func testStringReverseTwo() {
          let str = Programmers.reverse(str: "bbacc")
          
          XCTAssertEqual(str, "ccabb")
      }
}
