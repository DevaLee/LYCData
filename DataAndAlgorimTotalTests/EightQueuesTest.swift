//
//  EightQueuesTest.swift
//  DataAndAlgorimTotalTests
//
//  Created by 李玉臣 on 2020/8/22.
//  Copyright © 2020 liyuchen. All rights reserved.
//

import XCTest
@testable import DataAndAlgorimTotal

class EightQueuesTest: XCTestCase {

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

    func testEightQueue(){
        let queue = Queues(8)
        queue.placeQueues(8)
        print(queue.ways)

        let queue4 = Queues(4)
        queue4.placeQueues(4)
        print(queue4.ways)

        XCTAssert(queue.ways == 92 && queue4.ways == 2)
    }

}
