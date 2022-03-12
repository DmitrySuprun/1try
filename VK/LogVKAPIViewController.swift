//
//  LogVKAPIViewController.swift
//  VK
//
//  Created by Дмитрий Супрун on 27.02.22.
//

import UIKit
import Alamofire
import WebKit

class LogVKAPIViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView! {
        didSet {
            webView.navigationDelegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        urlComponents.queryItems = [URLQueryItem(name: "client_id", value: "8090325"),
                                    URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
                                    URLQueryItem(name: "display", value: "mobile"),
                                    URLQueryItem(name: "scope", value: "262150"),
                                    URLQueryItem(name: "response_type", value: "token"),
                                    URLQueryItem(name: "v", value: "5.68")]
        let request = URLRequest(url: urlComponents.url!)
        
        webView.load(request)
        
        
        
        
        /*
         AF.request("http://samples.openweathermap.org/data/2.5/forecast?q=Moscow,DE&appid=b1b15e88fa797225412429c1c50c122a1").responseJSON { response in
         print(response.value)
         }
         let param: Parameters = ["q":"Moscow,DE", "appid":"b1b15e88fa797225412429c1c50c122a1"]
         AF.request("http://samples.openweathermap.org/data/2.5/forecast", parameters: param).responseJSON { response in
         print("⚾️⚾️⚾️⚾️⚾️⚾️⚾️⚾️", response)
         }
         
         
         
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
         */
        
    }
    
}

extension LogVKAPIViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment else {
            decisionHandler(.allow)
            return
        }
        
        let params = fragment
            .components(separatedBy: "&")
            .map({ $0.components(separatedBy: "=") })
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
                
            }
        print(fragment)
        print(params)
        let token = params["access_token"]
        
        print(token!)
        SessionVK.instance.token = token!
        
        decisionHandler(.cancel)
        
        let alert = UIAlertController(title: "Запрос", message: "Старт зароса", preferredStyle: .actionSheet)
        let button1 = UIAlertAction(title: "Запрос через Alamofire", style: .destructive, handler: { _ in
            AF.request("https://api.vk.com/method/users.get?&access_token=\(SessionVK.instance.token)&v=5.131").responseJSON(completionHandler: { response in
                print(response.value)
            })
        })
        let button2 = UIAlertAction(title: "Запрос через натив: друзья, фото", style: .default) { _ in
            var urlConstructor = URLComponents()
            urlConstructor.scheme = "http"
            urlConstructor.host = "api.vk.com"
            let requestNameVK = "friends.get"
            urlConstructor.path = "/method/" + requestNameVK
            urlConstructor.queryItems = [URLQueryItem(name: "access_token", value: SessionVK.instance.token),
                                         URLQueryItem(name: "v", value: "5.131"),
                                         URLQueryItem(name: "lang", value: "en"),
                                         URLQueryItem(name: "fields", value: "city,nickname,photo_100")
            ]
            
            let configuration = URLSessionConfiguration.default
            let session = URLSession(configuration: configuration)
            var request = URLRequest(url: urlConstructor.url!)
            request.httpMethod = "POST"
            let task = session.dataTask(with: request) { data, response, error in
                let json = try? JSONSerialization.jsonObject(with: data!, options: .fragmentsAllowed)
                print(json)
            }
            task.resume()
        }
        let button3 = UIAlertAction(title: "Получение групп текущего пользователя", style: .default) { _ in
            var urlConstructor = URLComponents()
            urlConstructor.scheme = "http"
            urlConstructor.host = "api.vk.com"
            let requestNameVK = "groups.get"
            urlConstructor.path = "/method/" + requestNameVK
            urlConstructor.queryItems = [URLQueryItem(name: "access_token", value: SessionVK.instance.token),
                                         URLQueryItem(name: "v", value: "5.131"),
                                         URLQueryItem(name: "lang", value: "en"),
                                         URLQueryItem(name: "extended", value: "1")
            ]
            
            let configuration = URLSessionConfiguration.default
            let session = URLSession(configuration: configuration)
            var request = URLRequest(url: urlConstructor.url!)
            request.httpMethod = "POST"
            let task = session.dataTask(with: request) { data, response, error in
                let json = try? JSONSerialization.jsonObject(with: data!, options: .fragmentsAllowed)
                print(json)
            }
            task.resume()
        }
        let button4 = UIAlertAction(title: "Получение групп по поисковому запросу", style: .default) { _ in
            
        }
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelButton)

        alert.addAction(button1)
        alert.addAction(button2)
        alert.addAction(button3)
        present(alert, animated: true)
        
    }
}

