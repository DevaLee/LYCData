//
//  PriorityQueueTests.swift
//  DataAndAlgorimTotalTests
//
//  Created by 9tong on 2020/1/3.
//  Copyright © 2020 liyuchen. All rights reserved.
//

import XCTest
@testable import DataAndAlgorimTotal

class PriorityQueueTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPriorityQueue_whenDequeue() {
        var priorityQueue = PriorityQueue(sort: >, elements: [1, 12, 3, 4, 1, 6, 8, 7])
        XCTAssertEqual(12, priorityQueue.dequeue())
        XCTAssertEqual(8, priorityQueue.dequeue())
        XCTAssertEqual(7, priorityQueue.dequeue())
    }

}
