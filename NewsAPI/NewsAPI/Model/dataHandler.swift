//
//  dataHandler.swift
//  NewsAPI
//
//  Created by Sri Chanakya Yennana on 10/12/22.
//

import Foundation


class dataHandler : Decodable{
    var category : String
    var data : [DataClass]
}

class DataClass : Decodable{
    
    var title : String
    var content : String
    var imageUrl : String
    var date : String
}
