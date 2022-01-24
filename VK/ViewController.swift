//
//  ViewController.swift
//  VK
//
//  Created by Дмитрий Супрун on 9.01.22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var login: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBAction func enterButton(_ sender: UIButton) {
        if login.text == "1" && password.text == "1" {
            
        } else {
            let alertWrongPassword = UIAlertController(title: "Ошибка", message: "Неверный пароль", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "Ok", style: .default, handler: {_ in
                self.login.text = ""
                self.password.text = ""
            })
            alertWrongPassword.addAction(okButton)
            present(alertWrongPassword, animated: true, completion: nil)
        }
    }
    
    @IBAction func showPassword(_ sender: UIButton) {
        password.isSecureTextEntry = false
        
    }
    
}
//
//extension ViewController: UITableViewDataSource {
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 10
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "SomeCell", for: indexPath) as UITableViewCell
//
//    }
//
//
//}
//
