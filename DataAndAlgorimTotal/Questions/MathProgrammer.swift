//
//  MathProgrammer.swift
//  DataAndAlgorimTotal
//
//  Created by 9tong on 2020/3/27.
//  Copyright © 2020 liyuchen. All rights reserved.
//

import Foundation
import UIKit


class MathProgrammer {
    
    /*正号变负号，负号变正号*/
    static func negate(_ aM: Int) -> Int {
        var a = aM
        
        var neg = 0
        let d = a < 0 ? 1 : -1
        
        while a != 0 {
            neg = neg + d
            a = a + d
        }
        
        return neg
    
    }
    
    //MARK:--编写方法，实现整数的乘法、减法、和除法运算。只允许使用加号
    /* a - b */
    static func minus(_ a: Int,_ b: Int) -> Int {
        
        return a + negate(b)
    }
    
    static func mutiply(_ a: Int, by b: Int) -> Int {
      
        var sum = 0
        for _ in 0..<abs(a) {
            sum = sum + b
        }
        
        if  a < 0 {
            return negate(sum)
        }else {
            return sum
        }
    }
    
    static func divide(_ a: Int, by b:Int) -> Int {
        if b == 0 {
            return 0
        }
        let absA = abs(a)
        let absB = abs(b)
        var sum = absB
        var time = 0
        while sum <= absA {
            time += 1
            sum += absB
        }
        
        if (a > 0 && b > 0)  || (a < 0 && b < 0){
            return time
        }else {
            return negate(time)
        }
        
       // return sum
    }
    
    //MARK: --在二维平面上，有两个正方形，请找出一条直线，能够将两个正方形对半分，假定正方形的上下两条边与x轴平行
    // ---> 连接两个正方形的中心的线
    
    
}

class Square {
    
    var left = 0.0
    var right = 0.0
    var top = 0.0
    var bottom = 0.0
    

    
    func middle() -> CGPoint {
        
        return CGPoint(x: (left + right) / 2.0, y: (top + bottom) / 2.0)
    }
}
