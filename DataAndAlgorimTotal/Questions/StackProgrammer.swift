//
//  StackProgrammer.swift
//  DataAndAlgorimTotal
//
//  Created by 李玉臣 on 2020/3/7.
//  Copyright © 2020 liyuchen. All rights reserved.
//

import UIKit

class StackProgrammer: NSObject {



    

}

// SetOfStacks应该由多个栈组成，并且在前一个栈填满时新建一个栈，此外 SetOfStacks.push() 和 SetOfStacks.pop()应该与普通栈的操作方法相同

class SetOfStacks<T> {

    var stacks = StackC<StackC<T?>?>()

    func push(_ value: T?) {

        let last = getLastStack()
        if last != nil && !(last?.isFull() ?? false) {
            last?.push(value)

        }else {
            let stack = StackC<T?>(capacity: 3)
            stack.push(value)

            stacks.push(stack)

        }

    }


    func pop() -> T??  {
        let last = getLastStack()

        let value = last?.pop()

        if last?.isEmpty() ?? false {
            stacks.pop()
        }
        return value

    }

    func popAt(index : Int)  -> Int{

        return 0
    }


    private func getLastStack() -> StackC<T?>? {

        return stacks.peek() ?? nil
    }



}
