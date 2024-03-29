//
//  User.swift
//  FinalProject
//
//  Created by Romano on 18/12/2017.
//  Copyright © 2017 Romano. All rights reserved.
//

import Foundation
import FirebaseDatabase
class User{
    
    var userName:String
    var fullName:String
    var imageUrl:String?
    var lastUpdate:Date?
    var uID:String?
    var gender:String?
    var phone:String?
    var numberOfPosts:Int = 0

    
    init(userName:String, fullName:String, imageUrl:String? = nil, uID:String? = nil, gender:String? = nil, phone:String? = nil){
        self.userName=userName
        self.fullName=fullName
        self.imageUrl = imageUrl
        self.uID = uID
        self.gender = gender
        self.phone = phone
    }
    
    
    init(json:Dictionary<String,Any>){
        userName = json["userName"] as! String
        fullName = json["fullName"] as! String
        uID = json["uID"] as? String
        numberOfPosts=(json["numberOfPosts"] as? Int)!
        if let tel = json["phone"] as? String{
            phone = tel
        }
        
        if let gen = json["gender"] as? String{
            gender = gen
        }
        
        if let im = json["imageUrl"] as? String{
            imageUrl = im
        }
        
        if let user = json["lastUpdate"] as? Double{
            self.lastUpdate = Date.fromFirebase(user)
        }
    }
    
    func toJson() -> Dictionary<String,Any> {
        var json = Dictionary<String,Any>()
        json["userName"] = userName
        json["fullName"] = fullName
        json["gender"] = gender
        json["phone"] = phone
        json["uID"] = uID
        json["numberOfPosts"] = numberOfPosts
        if (imageUrl != nil){
            json["imageUrl"] = imageUrl!
        }
        json["lastUpdate"] = ServerValue.timestamp()
        return json
    }
    
    
}
