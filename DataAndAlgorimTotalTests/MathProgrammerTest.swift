//
//  MathProgrammerTest.swift
//  DataAndAlgorimTotalTests
//
//  Created by 9tong on 2020/3/27.
//  Copyright © 2020 liyuchen. All rights reserved.
//

import XCTest
@testable import DataAndAlgorimTotal
class MathProgrammerTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func testMinus(){
        
        let a = 10
        let b = 20
        
        let c =  MathProgrammer.minus(a, b)
        
        XCTAssertEqual(-10, c)
    }
    
    func testMutilpy1() {
        let a = -10
        let b = 2
        
        let c = MathProgrammer.mutiply(a, by: b)
        XCTAssertEqual(-20, c)
    }
    
    func testMultiply2() {
        let a = -10
        let b = -2
        
        let c = MathProgrammer.mutiply(a, by: b)
        XCTAssertEqual(c, 20)
    }
    
    func testDivide() {
        let a = 20
        let b = 2
        let c = MathProgrammer.divide(a, by: b)
        XCTAssertEqual(10, c)
    }
   

}
