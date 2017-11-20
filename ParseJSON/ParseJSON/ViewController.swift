//
//  ViewController.swift
//  ParseJSON
//
//  Created by Tran Quoc Bao on 11/20/17.
//  Copyright © 2017 Sutrix Solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  struct WebsiteDescription: Decodable {
    let name: String
    let description: String
    let courses: [Course]
  }
  
  struct Course: Decodable {
    let id: Int?
    let name: String?
    let link: String?
    let imageUrl: String?
    
//    init(json: [String: Any]) {
//      id = json["id"] as? Int ?? -1
//      name = json["name"] as? String ?? ""
//      link = json["link"] as? String ?? ""
//      imageUrl = json["imageUrl"] as? String ?? ""
//    }
  }
  
  struct Url {
    static let urlCourse = "https://api.letsbuildthatapp.com/jsondecodable/course"
    static let urlCourses = "https://api.letsbuildthatapp.com/jsondecodable/courses"
    static let urlWebsiteDescription = "https://api.letsbuildthatapp.com/jsondecodable/website_description"
    static let urlCoursesMissingFields = "https://api.letsbuildthatapp.com/jsondecodable/courses_missing_fields"
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()

    guard let url = URL(string: Url.urlCoursesMissingFields) else { return }
    
    URLSession.shared.dataTask(with: url) { (data, response, error) in
      guard let data = data else { return }
//      let dataAsString = String(data: data, encoding: .utf8)
//       print(dataAsString)
      do {
//        guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:Any] else { return }
//        let course = Course(json: json)
//        print(course)
        
        let course = try JSONDecoder().decode([Course].self, from: data)
        print(course)
        
//        let websiteDescription = try JSONDecoder().decode(WebsiteDescription.self, from: data)
//        print(websiteDescription.name, websiteDescription.description)
//        print("\n\(websiteDescription.courses)")
      } catch let jsonError {
        print("Error serializing json:", jsonError)
      }
    }.resume()
    
  }

}

