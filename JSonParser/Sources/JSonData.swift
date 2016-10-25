//
//  JSonData.swift
//  JSonParser
//
//  Created by oceannw on 16/9/20.
//  Copyright © 2016年 oceannw. All rights reserved.
//
import Foundation

public protocol JSonCreator{
    func create(dic:[String:JSonData]) -> JSonData
    
    func create(array:[JSonData]) -> JSonData
    func create(array:[String]) -> JSonData
    func create(array:[Int]) -> JSonData
    func create(array:[Float]) -> JSonData
    func create(array:[Double]) -> JSonData
    func create(array:[Bool]) -> JSonData
    
    func create(string:String) -> JSonData
    func create(int:Int) -> JSonData
    func create(float:Float) -> JSonData
    func create(double:Double) -> JSonData
    func create(bool:Bool) -> JSonData
    func createNil() -> JSonData
    static func create() -> JSonCreator
}

public class JSonCreatorManager:JSonCreator{
    
    private static let manager:JSonCreator = JSonCreatorManager()
    
    private init(){}
    
    public static func create() -> JSonCreator {
        return manager
    }
    
    public func create(dic: [String : JSonData]) -> JSonData {
        return JSonDataDictionary(dictionary: dic)
    }
    
    public func create(array: [JSonData]) -> JSonData {
        return JSonDataArray(array: array)
    }
    
    public func create(array: [String]) -> JSonData {
        let data = create(array: [JSonData]())
        for per in array{
            data.append(string: per)
        }
        return data
    }
    
    public func create(array: [Int]) -> JSonData {
        let data = create(array: [JSonData]())
        for per in array{
            data.append(int: per)
        }
        return data
    }
    
    public func create(array: [Float]) -> JSonData {
        let data = create(array: [JSonData]())
        for per in array{
            data.append(float: per)
        }
        return data
    }
    
    public func create(array: [Double]) -> JSonData {
        let data = create(array: [JSonData]())
        for per in array{
            data.append(double: per)
        }
        return data
    }
    
    public func create(array: [Bool]) -> JSonData {
        let data = create(array: [JSonData]())
        for per in array{
            data.append(bool: per)
        }
        return data
    }
    
    public func create(string: String) -> JSonData {
        return JSonDataString(string: string)
    }
    
    public func create(int: Int) -> JSonData {
        return JSonDataNumber(value: int)
    }
    
    public func create(float: Float) -> JSonData {
        return JSonDataNumber(value: float)
    }
    
    public func create(double: Double) -> JSonData {
        return JSonDataNumber(value: double)
    }
    
    public func create(bool: Bool) -> JSonData {
        return JSonDataBoolen(value: bool)
    }
    
    public func createNil() -> JSonData {
        return JSonDataNull.null
    }
}

public protocol JSonData:CustomStringConvertible{
    func toString() -> String
    func toInt() ->Int?
    func toFloat() -> Float?
    func toDouble() -> Double?
    func toBool() -> Bool?
    
    func toArray() -> [JSonData]?
    func toDictionary() -> [String:JSonData]?
    func append(data:JSonData)
    func append(key:String,value:JSonData)
    func remove(data:JSonData)
    func remove(key:String)
    subscript(index:Int) -> JSonData { get set }
    subscript(key:String) -> JSonData { get set }
}

extension JSonData{
    
    public var description: String{
        get{
            return toString()
        }
    }
    
    public func toString() -> String {
        return JSonDataNull.null.toString()
    }
    
    public func toInt() -> Int? {
        return nil
    }
    
    public func toFloat() -> Float? {
        return nil
    }
    
    public func toDouble() -> Double? {
        return nil
    }
    
    public func toBool() -> Bool? {
        return nil
    }
    
    public func toArray() -> [JSonData]? {
        return nil
    }
    
    public func toDictionary() -> [String : JSonData]? {
        return nil
    }
    
    public func append(data: JSonData) {}
    
    public func append(key: String, value: JSonData) {}
    
    public func remove(data: JSonData) {}
    
    public func remove(key: String) {}
    
    public subscript(index: Int) -> JSonData {
        get {
            return JSonDataNull.null
        }
        set {
            append(data: newValue)
        }
    }
    
    public subscript(key: String) -> JSonData {
        get{
            return JSonDataNull.null
        }
        
        set(newValue){
            append(key: key, value: newValue)
        }
    }
}
//convenience
extension JSonData{
    
    public func append(array:[JSonData]){
        append(data:JSonDataArray(array: array))
    }
    public func append(dic:[String:JSonData]){
        append(data:JSonDataDictionary(dictionary: dic))
    }
    public func append(string:String){
        append(data:JSonDataString(string: string))
    }
    public func append(int:Int){
        append(data:JSonDataNumber(value: int))
    }
    public func append(float:Float){
        append(data:JSonDataNumber(value: float))
    }
    public func append(double:Double){
        append(data:JSonDataNumber(value: double))
    }
    public func append(bool:Bool){
        append(data: JSonDataBoolen(value: bool))
    }
    
    public func append(key: String, value:[JSonData]){
        append(key: key, value: JSonDataArray(array: value))
    }
    public func append(key: String, value: [String:JSonData]){
        append(key: key, value: JSonDataDictionary(dictionary: value))
    }
    public func append(key: String, value: String){
        append(key: key, value: JSonDataString(string: value))
    }
    public func append(key: String, value: Int){
        append(key: key, value: JSonDataNumber(value: value))
    }
    public func append(key: String, value: Float){
        append(key: key, value: JSonDataNumber(value: value))
    }
    public func append(key: String, value: Double){
        append(key: key, value: JSonDataNumber(value: value))
    }
    public func append(key: String, value: Bool){
        append(key: key, value: JSonDataBoolen(value: value))
    }
    
    public func remove(array:[JSonData]){
        remove(data:JSonDataArray(array: array))
    }
    public func remove(dic:[String:JSonData]){
        remove(data:JSonDataDictionary(dictionary: dic))
    }
    public func remove(string:String){
        remove(data:JSonDataString(string: string))
    }
    public func remove(int:Int){
        remove(data:JSonDataNumber(value: int))
    }
    public func remove(float:Float){
        remove(data:JSonDataNumber(value: float))
    }
    public func remove(double:Double){
        remove(data:JSonDataNumber(value: double))
    }
    public func remove(bool:Bool){
        remove(data: JSonDataBoolen(value: bool))
    }
}
class JSonDataNull:JSonData{
    
    static let null = JSonDataNull()
    
    private init(){}
    
    func toString() -> String {
        return "null"
    }
}

class JSonDataString:JSonData{
    
    private var value:NSString
    
    required init(string:String){
        value = NSString(string:string)
    }
    
    func toString() -> String {
        return "\"\(value)\""
    }
    
    func toInt() -> Int? {
        return value.integerValue
    }
    
    func toFloat() -> Float? {
        return value.floatValue
    }
    
    func toDouble() -> Double? {
        return value.doubleValue
    }
    
    func toBool() -> Bool? {
        return value.integerValue > 0
    }
}

class JSonDataNumber:JSonData{
    
    private let number:NSNumber
    
    init(value:Int){
        number = NSNumber(value: value)
    }
    init(value:Float){
        number = NSNumber(value:value)
    }
    init(value:Double){
        number = NSNumber(value: value)
    }
    func toInt() -> Int? {
        return number.intValue
    }
    func toFloat() -> Float? {
        return number.floatValue
    }
    func toDouble() -> Double? {
        return number.doubleValue
    }
    func toBool() -> Bool? {
        return number.intValue > 0
    }
    
    func toString() -> String {
        return number.stringValue
    }
}

class JSonDataBoolen:JSonData{
    
    private let value:Bool
    
    init(value:Bool){
        self.value = value
    }
    func toInt() -> Int? {
        return value ? 1 : 0
    }
    func toFloat() -> Float? {
        return value ? 1 : 0
    }
    func toDouble() -> Double? {
        return value ? 1 : 0
    }
    func toBool() -> Bool? {
        return value
    }
    
    func toString() -> String {
        return value ? "true" : "false"
    }
}

class JSonDataArray:JSonData{
    
    private var array:[JSonData]
    
    init(array:[JSonData]){
        self.array = array
    }
    
    func toString() -> String {
        var result = "["
        var isFirst = true
        for data in array{
            if isFirst{
                isFirst = false
                result += data.description
            }else{
                result += "," + data.description
            }
        }
        return result + "]"
    }
    
    func toArray() -> [JSonData]? {
        return array
    }
    
    func append(data:JSonData){
        array.append(data)
    }
    
    func remove(data:JSonData){
        for i in 0..<array.count{
            if array[i].toString() == data.toString() {
                array.remove(at: i)
                return
            }
        }
    }
    
    subscript(index:Int) -> JSonData{
        get{
            return array[index]
        }
        
        set(newValue){
            append(data: newValue)
        }
    }
    
    subscript(key:String) -> JSonData{
        get{
            for per in array{
                if per.toString() == "\"\(key)\""{
                    return per
                }
            }
            return JSonDataNull.null
        }
        
        set(newValue){
            append(key: key, value: newValue)
        }
    }
}

class JSonDataDictionary:JSonData{
    
    private var dictionary:[String:JSonData]
    private var sequenceList:[String]
    
    init(dictionary:[String:JSonData]){
        self.dictionary = dictionary
        sequenceList = [String]()
        for (key,_) in dictionary{
            sequenceList.append(key)
        }
    }
    
    func toString() -> String{
        var result = "{\n"
        var isFirst = true
        for key in sequenceList{
            if isFirst{
                isFirst = false
                result += "\"\(key)\":\(dictionary[key] ?? JSonDataNull.null)"
            }else{
                result += ",\n"+"\"\(key)\":\(dictionary[key] ?? JSonDataNull.null)"
            }
        }
        return result + "\n}"
    }
    
    func toDictionary() -> [String : JSonData]? {
        return dictionary
    }
    
    func append(key:String,value:JSonData){
        if !containKey(fromArray:sequenceList,key:key){
            sequenceList.append(key)
        }
        dictionary[key] = value
    }
    
    private func containKey(fromArray:[String],key:String) -> Bool{
        for value in fromArray{
            if value == key{
                return true
            }
        }
        return false
    }
    
    private func indexAt(fromArray:[String],key:String) -> Int?{
        for i in 0..<fromArray.count{
            if fromArray[i] == key{
                return i
            }
        }
        return nil
    }
    
    func remove(key:String){
        if let index = indexAt(fromArray:sequenceList,key:key){
            sequenceList.remove(at: index)
            dictionary.removeValue(forKey: key)
        }
    }
    
    subscript(index: Int) -> JSonData {
        get {
            if index < sequenceList.count{
                return dictionary[sequenceList[index]] ?? JSonDataNull.null
            }
            return JSonDataNull.null
        }
        set {
            append(data: newValue)
        }
    }
    
    subscript(key:String) -> JSonData{
        get{
            if let value = dictionary[key]{
                return value
            }else{
                return JSonDataNull.null
            }
        }
        
        set(newValue){
            append(key: key, value: newValue)
        }
    }
}
