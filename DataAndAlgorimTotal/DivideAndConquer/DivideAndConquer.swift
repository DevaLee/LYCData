//
//  DivideAndConquer.swift
//  DataAndAlgorimTotal
//
//  Created by 李玉臣 on 2020/8/23.
//  Copyright © 2020 liyuchen. All rights reserved.
//

import Foundation


class DivideAndConquer {

    static func maxSubArrayOne(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        var maxTotalNum = Int.min  // 1

        for(beginIndex, _) in nums.enumerated() { // 2
            for (endIndex, _) in nums.enumerated().filter({ return $0.0 > beginIndex }) { // 3

                var tmpMaxNum = 0
                for index in beginIndex...endIndex { // 4
                    tmpMaxNum += nums[index]
                }
                if maxTotalNum < tmpMaxNum { // 5
                    maxTotalNum = tmpMaxNum
                }
            }
        }
        return maxTotalNum
    }

    static func maxSubArrayTwo(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        var maxTotalNum = Int.min

        for(beginIndex, _) in nums.enumerated() {
            var subTotal = 0
            for (endIndex, _) in nums.enumerated().filter({ return $0.0 > beginIndex }) {
                subTotal += nums[endIndex]
                maxTotalNum =  max(maxTotalNum, subTotal)
            }
        }
        return maxTotalNum
    }

    static func maxSubArrayThree(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }

        return maxSubArray(nums, 0, nums.count)
    }

    private static func maxSubArray(_ nums:[Int], _ begin: Int, _ end: Int)  -> Int{
        if (end - begin < 2) {
            return nums[begin]
        }


        let mid = (begin + end) >> 1

        // 最大子序列和一部分在左边序列，一部分在右边序列的情况
        // 1:计算右半部分最大连续子序列和
        var rightMax = nums[mid]
        var rightSum = rightMax
        for i in mid..<end {
            rightSum += nums[i]
            rightMax = max(rightSum, rightMax)
        }

        // 2，计算左半部分最大连续子序列和
        var leftMax = nums[mid - 1]
        var leftSum = leftMax
        for i in (begin..<(mid - 1)).reversed() {
            leftSum += nums[i]
            leftMax = max(leftSum, leftMax)
        }
        let maxSubOne = leftMax + rightMax

        // 最大连续子序列和，序列都在左边的情况
        let maxSubTwo = maxSubArray(nums, begin, mid)
        // 最大连续子序列和，序列都在右边的情况
        let maxSubThree = maxSubArray(nums, mid, end)
        return max(max(maxSubTwo,maxSubThree)
            , maxSubOne)
    }
}
