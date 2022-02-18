//
//  GroupTableViewController.swift
//  VK
//
//  Created by Дмитрий Супрун on 27.01.22.
//

import UIKit

class GroupTableViewController: UITableViewController {
    
    var groupList: [GroupListCellModel] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(GroupTableViewCell.nib(), forCellReuseIdentifier: "GroupTableViewCellID")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return groupList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupTableViewCellID", for: indexPath) as! GroupTableViewCell
        let model = groupList[indexPath.row]
        cell.setData(with: model)
        cell.circleView(image: model.image)
        return cell
    }
    
    @IBAction func unwindAddGroup (segue: UIStoryboardSegue) {
        if segue.identifier == "addCellID" {
            guard let allGroupTableViewController = segue.source as? AllGroupTableViewController,
                  let index = allGroupTableViewController.tableView.indexPathForSelectedRow else { return }
            let selectedGroup = allGroupTableViewController.allGroup[index.row]
            groupList.append(.init(name: selectedGroup.name, image: selectedGroup.image))
            tableView.reloadData()
        }
    }
}
