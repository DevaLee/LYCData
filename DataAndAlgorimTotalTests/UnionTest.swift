//
//  UnionTest.swift
//  DataAndAlgorimTotalTests
//
//  Created by 李玉臣 on 2020/7/31.
//  Copyright © 2020 liyuchen. All rights reserved.
//

import XCTest

@testable import DataAndAlgorimTotal

class UnionTest: XCTestCase {

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

    func testQuickFind() {
        let qf = QuickFind(capacity: 7)
        qf.union(5, 6)
        qf.union(5, 4)
        qf.union(2, 1)
        let oneSame = qf.isSame(5, 6) // true

        let twoSame = qf.isSame(1, 5) // false
        let threeSame = qf.isSame(4, 6) // true

        XCTAssert(oneSame == true && twoSame == false && threeSame == true)
    }

    func testQuickUnion() {
        let qf = QuickUnion(capacity: 7)
        qf.union(5, 6)
        qf.union(5, 4)
        qf.union(2, 1)
        let oneSame = qf.isSame(5, 6) // true

        let twoSame = qf.isSame(1, 5) // false
        let threeSame = qf.isSame(4, 6) // true

        XCTAssert(oneSame == true && twoSame == false && threeSame == true)
    }
}
