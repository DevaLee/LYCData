//
//  GreedyTest.swift
//  DataAndAlgorimTotalTests
//
//  Created by 李玉臣 on 2020/8/23.
//  Copyright © 2020 liyuchen. All rights reserved.
//

import XCTest
@testable import DataAndAlgorimTotal

class GreedyTest: XCTestCase {

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


    func testBestLoadSolution(){
        let capacity = 30
        let weights = [3, 5, 4, 10, 7, 14, 2, 11]
        let count = Greedy.bestLoadSolution(weights, capacity)
        XCTAssert(count == 5)
    }

    func testChangeCoin(){
        let coins = [25, 5, 10, 1]
        let totalMoney = 41
        let exchangeCoins = Greedy.coinChange(coins, totalMoney)
        print(exchangeCoins)


        let anotherCoins = [25, 20, 5, 1]

        let anotherExchangeCoins = Greedy.coinChange(anotherCoins, totalMoney)
        print(anotherExchangeCoins)

        XCTAssert(exchangeCoins == [25, 10, 5 ,1] && anotherExchangeCoins == [25, 5, 5, 5, 1])
    
    }

}
