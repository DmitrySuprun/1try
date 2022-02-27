//
//  LogVKAPIViewController.swift
//  VK
//
//  Created by Дмитрий Супрун on 27.02.22.
//

import UIKit
import Alamofire

class LogVKAPIViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
/*
//        let url = URL(string: "http://samples.openweathermap.org/data/2.5/forecast?q=Moscow,DE&appid=b1b15e88fa797225412429c1c50c122a1")
//        Создаем конструктор для URL
        var urlConstructor = URLComponents()
        urlConstructor.scheme = "http"
        urlConstructor.host = "samples.openweathermap.org"
        urlConstructor.path = "/data/2.5/forecast"
        urlConstructor.queryItems = [URLQueryItem(name: "q", value: "München,DE"), URLQueryItem(name: "appid", value: "b1b15e88fa797225412429c1c50c122a1")]
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        
//        Конфигурация по умолчанию
//        let session = URLSession.shared
        
//        let task = session.dataTask(with: url!) { data, responce, error in
        let task = session.dataTask(with: urlConstructor.url!) { data, responce, error in

            let json = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments)
            
            print(json)
        }
 
 */
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        
        
        var urlConstructor = URLComponents()
        urlConstructor.scheme = "http"
        urlConstructor.host = "jsonplaceholder.typicode.com"
        urlConstructor.path = "/posts"
        urlConstructor.queryItems = [URLQueryItem(name: "title", value: "foo"),
                                     URLQueryItem(name: "body", value: "bar"),
                                     URLQueryItem(name: "userId", value: "1")]
        // создаем запрос
        var request = URLRequest(url: urlConstructor.url!)
        request.httpMethod = "POST"
        
        let task = session.dataTask(with: request) { data, responce, error in
            let json = try? JSONSerialization.jsonObject(with: data!, options: .fragmentsAllowed)
            print(json)
        }
        
        // запускаем задачу
        task.resume()
        
        print("Check")
    }
    
    
    
}
