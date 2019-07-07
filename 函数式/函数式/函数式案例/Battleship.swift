//
//  Battleship.swift
//  函数式
//
//  Created by Rudy on 2019/7/7.
//  Copyright © 2019 Rudy. All rights reserved.
//

import Foundation
import CoreGraphics

public typealias Distance = Double

struct Positon {
    var x:Distance
    var y:Distance
    init(x:Distance, y:Distance) {
        self.x = x
        self.y = y
    }
}

extension Positon{
    func inRange(range:Distance) -> Bool {
        return self.distance <= range
    }
    
    func minus(p:Positon) -> Positon {
        return Positon(x: x - p.x, y: y - p.y)
    }
    
    var distance:Distance{
        return sqrt(x * x + y * y)
    }
    
}

struct Ship {
    var position:Distance
    var firingRange:Distance
    var unsafeRange:Distance
}

typealias Region = (Positon) -> Bool

//以圆点为圆心的圆
func circle(radius:Distance) -> Region {
    return { point in point.distance <= radius }
}

func rectangle(rect:CGRect) -> Region {
    return { point in rect.contains(CGPoint(x: point.x, y: point.y))}
}

//以给定坐标为圆心的圆
func circle02(radius:Distance, center:Positon) -> Region {
    return { point in point.minus(p: center).distance <= radius}
}

func shift(regin:@escaping Region, offset:Positon) -> Region {
    return { point in regin(point.minus(p: offset))}
}



