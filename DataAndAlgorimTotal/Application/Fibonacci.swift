//
//  Fibonacci.swift
//  DataAndAlgorimTotal
//
//  Created by 9tong on 2019/11/5.
//  Copyright © 2019 liyuchen. All rights reserved.
//

import Foundation

public class Fibonacci {
    
    public static func fib(_ n: Int) -> Int {
        
        if n < 2 {
            return 1
        }

        return fib(n - 1) + fib(n - 2)
    }
    
    public static func fibTwo(_ n: Int) -> Int {
        
        if n < 2 {
            return 1
        }
        var firstNum = 1
        var secondNum = 2
        for _ in 2..<n {
            secondNum = firstNum + secondNum
            firstNum = secondNum - firstNum
        }
        
        return secondNum
        
    }
}






