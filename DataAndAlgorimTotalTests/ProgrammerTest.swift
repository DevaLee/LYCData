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
    
    func testSortedEqual() {
        
        XCTAssertTrue(Programmers.permutation(s1: "wesweef", s2: "weseefw"))
    }
    
    func testReplaceString() {
        
        let str = "abc hnj ert"

        XCTAssertEqual(Programmers.replaceSpace(str: str), "abc%20hnj%20ert")
    }
    
    func testStringCompose() {
        
        let str = "abbcdeeeaaawb"
        XCTAssertEqual(Programmers.composeString(str), "ab2cde3a3wb")
    }
    
    func testSetZeroMatrix() {
        var matrix = [[1, 2, 3], [4, 0, 6], [7, 8, 9]]
        
        let changeMatrix = [[1, 0, 3], [0, 0, 0], [7, 0, 9]]
        Programmers.setZeros(matrix: &matrix)
        
        XCTAssertEqual(matrix, changeMatrix)
    }
}
