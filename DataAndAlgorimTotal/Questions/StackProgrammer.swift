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




extension StackProgrammer {
    //MARK: -- 对栈排序 ---- begin
    // 编写程序，按升序对栈进行排序，最多只能使用一个额外的栈存放临时数据，但不能讲元素复制到
    // 别的数据结构中（如数组）。该栈支持如下操作：push、pop、peek和 isEmpty.

   static func sortStack<T: Comparable>(stack: Stack<T>) -> Stack<T> {
        var sortedStack = Stack<T>([])

        var nStack = stack

        while !nStack.isEmpty() {
            let tmpValue = nStack.pop()!
            while   tmpValue < sortedStack.peek() ?? tmpValue {
                nStack.push(sortedStack.pop() ?? tmpValue)
            }

            sortedStack.push(tmpValue)
        }

        return sortedStack

    }
}




//MARK: -- 汉诺塔 ---- begin
public class Tower {
    var disks = Stack<Int>()
    private var _index = 0
    
    public init(_ index: Int) {
        _index = index
    }
    
    
    public func index() -> Int {
        
        return _index
    }
    
    public func add(_ d: Int) {
        if !disks.isEmpty() && disks.peek() ?? -1 < d {
            fatalError("error placing disk")
        }else {
            disks.push(d)
        }
    }
    
    
    public func moveTopTo(t: Tower) {
        let top = disks.pop() ?? -1
        t.add(top)
        
        let fromIndex = index()
        let toIndex = t.index()
        print("move disk \(top) from \(fromIndex) to \(toIndex)")
   
        
    }
    
    public func moveDisks(n: Int, destination: Tower, buffer: Tower) {
        if n > 0 {
            moveDisks(n: n - 1, destination: buffer, buffer: destination)
            moveTopTo(t: destination)
            buffer.moveDisks(n: n - 1, destination: destination, buffer: self)
        }
        
    }
}

//MARK: -- 汉诺塔 ---- ends



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



