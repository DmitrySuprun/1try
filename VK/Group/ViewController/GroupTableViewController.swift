//
//  GroupTableViewController.swift
//  VK
//
//  Created by Дмитрий Супрун on 27.01.22.
//

import UIKit

class GroupTableViewController: UITableViewController {
    
    var groupList: [GroupListCellModel] = []
    var searchGroupListBackUp: [GroupListCellModel] = []
    
    @IBOutlet weak var searchBar: UISearchBar!
    
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
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            groupList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    
    @IBAction func unwindAddGroup (segue: UIStoryboardSegue) {
        if segue.identifier == "addCellID" {
            guard let allGroupTableViewController = segue.source as? AllGroupTableViewController,
                  let index = allGroupTableViewController.tableView.indexPathForSelectedRow else { return }
            let selectedGroup = allGroupTableViewController.allGroup[index.row]
            if !groupList.contains(where: { $0.name == selectedGroup.name }) {
                groupList.append(.init(name: selectedGroup.name, image: selectedGroup.image))
            }
            tableView.reloadData()
        }
    }
}

extension GroupTableViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchGroupListBackUp = groupList
    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        groupList = searchGroupListBackUp
        tableView.reloadData()
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        groupList = searchGroupListBackUp
        if !searchText.isEmpty {
            groupList = groupList.filter { $0.name.lowercased().contains(searchText.lowercased())}
        }
        tableView.reloadData()
    }
    
    
}
