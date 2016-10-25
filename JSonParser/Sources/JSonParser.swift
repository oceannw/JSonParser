//
//  JSonParser.swift
//  JSonParser
//
//  Created by oceannw on 16/9/22.
//  Copyright © 2016年 oceannw. All rights reserved.
//
import Foundation

public protocol JSonParser{
    func parse(json:String) -> JSonData?
    func parse(jsonData:Data) -> JSonData?
    static func create() -> JSonParser
}

public class JSonParserManager:JSonParser{
    
    private static let manager = JSonParserManager()
    private let _creator:JSonCreator = JSonCreatorManager.create()
    
    private init(){}
    
    public static func create() -> JSonParser {
        return manager
    }
    
    public func parse(jsonData: Data) -> JSonData? {
        do{
            let json = try JSONSerialization.jsonObject(with: jsonData, options: .allowFragments)
            let result = convert(any: json)
            return result
        }catch{
            return nil
        }
    }
    
    public func parse(json: String) -> JSonData? {
        guard let data = json.data(using: .utf8) else{
            return nil
        }
        return parse(jsonData: data)
    }
    
    private func convert(any:Any) -> JSonData?{
        if let string = any as? String{
            return _creator.create(string: string)
        }
        if let int = any as? Int{
            return _creator.create(int: int)
        }
        if let float = any as? Float{
            return _creator.create(float: float)
        }
        if let double = any as? Double{
            return _creator.create(double:double)
        }
        if let bool = any as? Bool{
            return _creator.create(bool: bool)
        }
        if let array = any as? NSArray{
            let result = _creator.create(array: [JSonData]())
            for per in array{
                if let data = convert(any: per){
                    result.append(data: data)
                }
            }
        }
        if let dic = any as? NSDictionary{
            let result = _creator.create(dic: [String : JSonData]())
            for (key,value) in dic{
                if let data = convert(any: value) , let k = key as? String{
                    result.append(key: k, value: data)
                }
            }
        }
        return nil
    }
}
