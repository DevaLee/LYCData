//
//  RecursionTest.swift
//  DataAndAlgorimTotalTests
//
//  Created by 李玉臣 on 2020/8/17.
//  Copyright © 2020 liyuchen. All rights reserved.
//

import XCTest
@testable import DataAndAlgorimTotal

class RecursionTest: XCTestCase {

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

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testfib(){
        let a = Recursion.fib(4)
        let b = Recursion.fib1(4)

        print("a: \(a), b:\(b)")

        XCTAssert(a == b)

    }

}
