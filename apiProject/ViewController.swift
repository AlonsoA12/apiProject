//
//  ViewController.swift
//  apiProject
//
//  Created by ALONSO ALCANTAR on 1/24/19.
//  Copyright © 2019 ALONSO ALCANTAR. All rights reserved.
//

import UIKit

struct Course: Decodable{
    let id: Int
    let name: String
    let link: String
    let imageUrl: String
    
    init(json: [String: Any]) {
        id = json["id"] as? Int ?? -1
        name = json["name"] as? String ?? ""
        link = json["name"] as? String ?? ""
        imageUrl = json["name"] as? String ?? ""
    }
}
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
  
        let jsonUrlString = "https://api.letsbuildthatapp.com/jsondecodable/course"
        guard let url = URL(string: jsonUrlString) else
        { return }
        
        URLSession.shared.dataTask(with: url) { (data, responce, err) in
            //-- check err
            //--also check responce status 200
           guard let data = data else { return }
            
         //--   let dataAsString = String(data: data, encoding:.utf8)
         //--   print(dataAsString)
            
            do{
                let course = try JSONDecoder().decode(Course.self, from: data)
                print(course.name)
                //--Swift 2/3/ObjC
// --               guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] else { return}
//--
// --               let course = Course(json: json)
//  --              print(course.name)
            }catch let jsonErr{
              print("Error serializing json", jsonErr)
            }
            
        }.resume()
   //--     let myCourse = Course( id: 1, name: "my course", link: "some link", imageUrl: "some image url")
    //--    print(myCourse)
        
    }


}

