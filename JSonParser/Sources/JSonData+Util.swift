//
//  JSonData+Util.swift
//  JSonParser
//
//  Created by oceannw on 16/9/20.
//  Copyright © 2016年 oceannw. All rights reserved.
//
import Foundation

///Core
public func +(origin:JSonData,append:JSonData) -> JSonData{
    origin.append(data: append)
    return  origin
}

public func +=(origin:inout JSonData,append:JSonData){
    origin.append(data: append)
}

public func +(origin:JSonData,append:(String,JSonData)) -> JSonData{
    origin.append(key: append.0, value: append.1)
    return origin
}

public func +=(origin:inout JSonData,append:(String,JSonData)){
    origin.append(key: append.0, value: append.1)
}

//Extension-String
public func +(origin:JSonData,append:String) -> JSonData{
    return origin + JSonDataString(string: append)
}

public func +=(origin:inout JSonData,append:String){
    origin += JSonDataString(string: append)
}

public func +(origin:JSonData,append:(String,String)) -> JSonData{
    return origin + (append.0,JSonDataString(string: append.1))
}

public func +=(origin:inout JSonData,append:(String,String)){
    origin += (append.0,JSonDataString(string: append.1))
}

//Extension-Int
public func +(origin:JSonData,append:Int) -> JSonData{
    return origin + JSonDataNumber(value: append)
}

public func +=(origin:inout JSonData,append:Int){
    origin += JSonDataNumber(value: append)
}

public func +(origin:JSonData,append:(String,Int)) -> JSonData{
    return origin + (append.0,JSonDataNumber(value: append.1))
}

public func +=(origin:inout JSonData,append:(String,Int)){
    origin += (append.0,JSonDataNumber(value: append.1))
}

//Extension-Float
public func +(origin:JSonData,append:Float) -> JSonData{
    return origin + JSonDataNumber(value: append)
}

public func +=(origin:inout JSonData,append:Float){
    origin += JSonDataNumber(value: append)
}

public func +(origin:JSonData,append:(String,Float)) -> JSonData{
    return origin + (append.0,JSonDataNumber(value: append.1))
}

public func +=(origin:inout JSonData,append:(String,Float)){
    origin += (append.0,JSonDataNumber(value: append.1))
}

//Extension-Double
public func +(origin:JSonData,append:Double) -> JSonData{
    return origin + JSonDataNumber(value: append)
}

public func +=(origin:inout JSonData,append:Double){
    origin += JSonDataNumber(value: append)
}

public func +(origin:JSonData,append:(String,Double)) -> JSonData{
    return origin + (append.0,JSonDataNumber(value: append.1))
}

public func +=(origin:inout JSonData,append:(String,Double)){
    origin += (append.0,JSonDataNumber(value: append.1))
}

//Extension-Bool
public func +(origin:JSonData,append:Bool) -> JSonData{
    return origin + JSonDataBoolen(value: append)
}

public func +=(origin:inout JSonData,append:Bool){
    origin += JSonDataBoolen(value: append)
}

public func +(origin:JSonData,append:(String,Bool)) -> JSonData{
    return origin + (append.0,JSonDataBoolen(value: append.1))
}

public func +=(origin:inout JSonData,append:(String,Bool)){
    origin += (append.0,JSonDataBoolen(value: append.1))
}
