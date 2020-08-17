//
//  Recursion.swift
//  DataAndAlgorimTotal
//
//  Created by 李玉臣 on 2020/8/17.
//  Copyright © 2020 liyuchen. All rights reserved.
//

import Foundation

public class Recursion {



    // MARK: -- 斐波那契
    static func fib1(_ n: Int)->Int{
        if n < 2  {
            return 1
        }
        var first = 1;
        var second = 1;
        
        for _ in 0..<n-2 {
            second = first + second
            first = second - first
        }
        
        return second
    }
    
    static func fib(_ n: Int) -> Int {
        if n <= 2 {
            return 1
        }
        
        return fib(n - 1) + fib(n - 2)
    }

    // MARK: -- 爬楼梯
    static func climbStair(_ n: Int) -> Int{
        if n <= 2 {
            return n
        }
        return climbStair(n - 1) + climbStair(n - 2)
    }

    //MARK: -- hanoi（汉诺塔）
    // 将 n 个碟子从plateOne,移到 plateThree, plateTwo为中间的柱子
    static func hanoi(_ n: Int,  _ plateOne: String,_ plateTwo: String, _ plateThree: String) {
        if n == 1 {
            movePlate(n, plateOne, plateThree)
            return
        }

        hanoi(n - 1, plateOne, plateThree, plateTwo)
        movePlate(n, plateOne, plateThree)
        hanoi(n - 1, plateTwo, plateOne, plateThree)

    }


    //将 n 号盘子从 from柱 移动到 to柱
    static func movePlate(_ n: Int, _ from : String, _ to: String) {
        print("将 \(n) 号盘子从\(from)柱, 移动到\(to)柱")
    }


}


