//
//  DynamicProgrammingTest.swift
//  DataAndAlgorimTotalTests
//
//  Created by 李玉臣 on 2020/8/26.
//  Copyright © 2020 liyuchen. All rights reserved.
//

import XCTest
@testable import DataAndAlgorimTotal
class DynamicProgrammingTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testDynamicProgrammingOne(){
        let num = DynamicProgramming.coinChange(41)
        XCTAssert(num == 3)
    }


    func testDynamicProgramingTwo(){
        let num = DynamicProgramming.coinChangeTwo(41)
        XCTAssert(num == 3)
    }

    func testDynamicProgramingThree(){
        let num = DynamicProgramming.coinsChangeThree(41)
        XCTAssert(num == 3)
    }

    func testAnmoShi(){
        let num = DynamicProgramming.anmoshi([1, 2, 3, 1])
        XCTAssert(num == 4)
    }

    func testAnmoShiTwo(){
        let num = DynamicProgramming.anmoshiTwo([1, 2, 3, 1])
        XCTAssert(num == 4)

    }

    func testAnmoShiThree(){
        let num = DynamicProgramming.anmoshiThree([1, 2, 3, 1])
        XCTAssert(num == 4)

    } 
}
