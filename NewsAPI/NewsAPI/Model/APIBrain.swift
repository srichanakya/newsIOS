//
//  APIBrain.swift
//  NewsAPI
//
//  Created by Sri Chanakya Yennana on 10/12/22.
//

import Foundation
import UIKit

protocol NewsManagerDelegate{
    
    func updateNewsOnUI(title:String,body:String,img:String)
    
    
}

class APIBrain{
    
    
    var delegate : NewsManagerDelegate?
   var users = [DataClass]()
    
    var count = 0
    
    
    func callAPI(_ categoty : String){
        var cat = categoty
        guard let url = URL(string: "https://inshorts.deta.dev/news?category=\(cat)") else{
            return
        }


        let task = URLSession.shared.dataTask(with: url){ [self]
            data, response, error in
            
            let decoder = JSONDecoder()
            
            if let data = data{
                
                       do{
                           let tasks = try decoder.decode(dataHandler.self, from: data)
                           print(tasks.data[count].title)
                           
                           delegate?.updateNewsOnUI(title: tasks.data[count].title, body: tasks.data[count].content, img: tasks.data[count].imageUrl)
//                           testingMethod(tasks.data)
                           users = tasks.data
                           
                           count += 1
                       }catch{
                           print(error)
                       }
                   }        }

        task.resume()
    }

//    func testingMethod(_ tasks: [DataClass]){
//        users = tasks
//    }
    
    func newNews(_ count: Int){
//        print(users[count].imageUrl)
        
        if count < users.count {
            delegate?.updateNewsOnUI(title: users[count].title, body: users[count].content, img:  users[count].imageUrl)
        }
    }
    
}
