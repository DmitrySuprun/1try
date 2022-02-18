//
//  FriendsListTableViewController.swift
//  VK
//
//  Created by Дмитрий Супрун on 24.01.22.
//

import UIKit

class FriendsListViewController: UIViewController {

    var contactList: [FriendsListCellModel] = [.init(name: "Иван", image: "1", likeCout: 1),
                                               .init(name: "Петр", image: "2", likeCout: 2),
                                               .init(name: "Глеб", image: "3", likeCout: 3),
                                               .init(name: "Сергей", image: "4", likeCout: 4),
                                               .init(name: "Елена", image: "5", likeCout: 5),
                                               .init(name: "Юлия", image: "6", likeCout: 6),
                                               .init(name: "Виктор", image: "7", likeCout: 7),
                                               .init(name: "Вацлав", image: "8", likeCout: 8),
                                               .init(name: "Гражина", image: "9", likeCout: 9),
                                               .init(name: "Андрей", image: "10", likeCout: 10),
                                               .init(name: "Роман", image: "11", likeCout: 11),
                                               .init(name: "Ярослав", image: "12", likeCout: 12),
                                               .init(name: "Алена", image: "13", likeCout: 13),
                                               .init(name: "Филипп", image: "14", likeCout: 14),
                                               .init(name: "Алексей", image: "15", likeCout: 15),
                                               .init(name: "Жанна", image: "16", likeCout: 14),
                                               .init(name: "Гелена", image: "17", likeCout: 13),
                                               .init(name: "Борис", image: "18", likeCout: 12),
                                               .init(name: "Николай", image: "19", likeCout: 11),
                                               .init(name: "Юрий", image: "20", likeCout: 10),
                                               .init(name: "Дмитрий", image: "21", likeCout: 9),
                                               .init(name: "Кирилл", image: "22", likeCout: 8),
                                               .init(name: "Татьяна", image: "23", likeCout: 7),
                                               .init(name: "Ольга", image: "24", likeCout: 6),
                                               .init(name: "Лиза", image: "25", likeCout: 5),
                                               .init(name: "Инна", image: "26", likeCout: 4),
                                               .init(name: "Мария", image: "27", likeCout: 3),
                                               .init(name: "Константин", image: "28", likeCout: 2),
                                               .init(name: "Евгений", image: "29", likeCout: 1),
                                               .init(name: "Зинаида", image: "30", likeCout: 0),
                                               .init(name: "Владислав", image: "31", likeCout: 1),
                                               .init(name: "Вячеслав", image: "32", likeCout: 2),
                                               .init(name: "Михаил", image: "33", likeCout: 3),
                                               .init(name: "Пол", image: "34", likeCout: 4),
                                               .init(name: "Джон", image: "35", likeCout: 5),
                                               .init(name: "Элла", image: "36", likeCout: 6),
                                               .init(name: "Антуан", image: "37", likeCout: 7),
                                               .init(name: "Шон", image: "38", likeCout: 8),
                                               .init(name: "Ибрагим", image: "39", likeCout: 9),
                                               .init(name: "Сальвадорэ", image: "40", likeCout: 10)]
    
    var contactListForTableView = [[FriendsListCellModel]]()

           
    
    func sortContactListForTableView (contactList: [FriendsListCellModel]) -> [[FriendsListCellModel]] {
        let sortedContactList = contactList.sorted(by: {$0.name < $1.name})

        var result = [[FriendsListCellModel]]()
        var arrayTemp = [sortedContactList[0]]

        for i in 1...(contactList.count - 1) {
            if arrayTemp.last!.name.first! == sortedContactList[i].name.first! {
                arrayTemp.append(sortedContactList[i])
            } else {
                result.append(arrayTemp)
                arrayTemp.removeAll()
                arrayTemp.append(sortedContactList[i])
            }
        }
        result.append(arrayTemp)
        return result
    }
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tableView.register(FriendsListTableViewCell.nib(), forCellReuseIdentifier: "FriendsListTableViewCellID")
        contactList = contactList.sorted(by: {$0.name < $1.name})
        contactListForTableView = sortContactListForTableView(contactList: contactList)
//        var abcContron
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func addNewFriend(_ sender: Any) {
        let alertController = UIAlertController(title: "Добавить нового друга", message: "Введите имя", preferredStyle: .alert)
        alertController.addTextField(configurationHandler: { textField in
            textField.placeholder = "Имя"
        })
        
        let createButton = UIAlertAction(title: "Create", style: .default, handler: { [self] _ in
            guard let contactName = alertController.textFields?[0].text else { return }
            self.contactList.append(.init(name: contactName, image: "NewFriend", likeCout: 0))
            self.contactList = contactList.sorted(by: { $0.name < $1.name })
            contactListForTableView = sortContactListForTableView(contactList: contactList)
            self.tableView.reloadData()
        })
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(createButton)
        alertController.addAction(cancelButton)
        
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "friendProfile" {
            guard let collectionViewController = segue.destination as? FriendProfileInfoCollectionViewController, let model = sender as? FriendsListCellModel else { return }
            collectionViewController.userDataInfo.append(model)
        }
    }
    
    // MARK: -UIControl
    
   
    
    
    
    
}

extension FriendsListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        var result = [String]()
        for i in 0..<contactListForTableView.count {
            result.append(String(contactListForTableView[i][0].name.first!))
        }
        
        return result
    }
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        var result = [String]()
        for i in 0..<contactListForTableView.count {
            result.append(String(contactListForTableView[i][0].name.first!))
        }
        return result.firstIndex(of: title)!
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionName: String
        sectionName = String(contactListForTableView[section][0].name.first!)
        return sectionName
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return contactListForTableView.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return contactListForTableView[section].count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsListTableViewCellID", for: indexPath) as! FriendsListTableViewCell
        let model = contactListForTableView[indexPath.section][indexPath.row]
        cell.setData(with: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = contactListForTableView[indexPath.section][indexPath.row]
        performSegue(withIdentifier: "friendProfile", sender: model)
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            if contactListForTableView[indexPath.section].count == 1 {
                contactListForTableView.remove(at: indexPath.section)
                tableView.deleteSections(IndexSet(integer: indexPath.section), with: .fade)
            } else {
                contactListForTableView[indexPath.section].remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    
}
