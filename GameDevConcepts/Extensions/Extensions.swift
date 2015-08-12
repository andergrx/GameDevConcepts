//
//  Extensions.swift
//  GameDevConcepts
//
//  Created by Gabriel Anderson on 8/11/15.
//  Copyright (c) 2015 Gabriel Anderson. All rights reserved.
//

import Foundation
import Cocoa

func ==(lhs: CGFloat, rhs: Float) -> Bool {
    return Float(lhs) == rhs
}

func ==(lhs: Float, rhs: CGFloat) -> Bool {
    return lhs == Float(rhs)
}

func !=(lhs: CGFloat, rhs: Float) -> Bool {
    return Float(lhs) != rhs
}

func !=(lhs: Float, rhs: CGFloat) -> Bool {
    return lhs != Float(rhs)
}

func <(lhs: CGFloat, rhs: Float) -> Bool {
    return Float(lhs) < rhs
}

func <(lhs: Float, rhs: CGFloat) -> Bool {
    return lhs < Float(rhs)
}

func <=(lhs: CGFloat, rhs: Float) -> Bool {
    return Float(lhs) <= rhs
}

func <=(lhs: Float, rhs: CGFloat) -> Bool {
    return lhs <= Float(rhs)
}

func >(lhs: CGFloat, rhs: Float) -> Bool {
    return Float(lhs) > rhs
}

func >(lhs: Float, rhs: CGFloat) -> Bool {
    return lhs > Float(rhs)
}

func >=(lhs: CGFloat, rhs: Float) -> Bool {
    return Float(lhs) >= rhs
}

func >=(lhs: Float, rhs: CGFloat) -> Bool {
    return lhs >= Float(rhs)
}

func +(lhs: CGFloat, rhs: Float) -> CGFloat {
    return lhs + CGFloat(rhs)
}

func +(lhs: CGFloat, rhs: Float) -> Float {
    return Float(lhs) + rhs
}

func +(lhs: Float, rhs: CGFloat) -> CGFloat {
    return CGFloat(lhs) + rhs
}

func +(lhs: Float, rhs: CGFloat) -> Float {
    return lhs + Float(rhs)
}

func -(lhs: CGFloat, rhs: Float) -> CGFloat {
    return lhs - CGFloat(rhs)
}

func -(lhs: CGFloat, rhs: Int) -> Float {
    return Float(lhs - CGFloat(rhs))
}

func -(lhs: CGFloat, rhs: Float) -> Float {
    return Float(lhs) - rhs
}

func -(lhs: Float, rhs: CGFloat) -> CGFloat {
    return CGFloat(lhs) - rhs
}

func -(lhs: Float, rhs: CGFloat) -> Float {
    return lhs - Float(rhs)
}

func *(lhs: CGFloat, rhs: Float) -> CGFloat {
    return lhs * CGFloat(rhs)
}

func *(lhs: CGFloat, rhs: Float) -> Float {
    return Float(lhs) * rhs
}

func *(lhs: Float, rhs: CGFloat) -> CGFloat {
    return CGFloat(lhs) * rhs
}

func *(lhs: Float, rhs: CGFloat) -> Float {
    return lhs * Float(rhs)
}

func /(lhs: CGFloat, rhs: Float) -> CGFloat {
    return lhs / CGFloat(rhs)
}

func /(lhs: CGFloat, rhs: Float) -> Float {
    return Float(lhs) / rhs
}

func /(lhs: Float, rhs: CGFloat) -> CGFloat {
    return CGFloat(lhs) / rhs
}

func /(lhs: Float, rhs: CGFloat) -> Float {
    return lhs / Float(rhs)
}

/*func -=(lhs: Float, rhs: Float) -> Float {
    return lhs - rhs
}*/



