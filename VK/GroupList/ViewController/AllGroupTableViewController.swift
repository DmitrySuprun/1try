//
//  AllGroupTableViewController.swift
//  VK
//
//  Created by Дмитрий Супрун on 31.01.22.
//

import UIKit

class AllGroupTableViewController: UITableViewController {
    
    var allGroup: [AllGroupCellModel] = [.init(name: "Север", image: "101"),
                                         .init(name: "Юг", image: "102"),
                                         .init(name: "Восток", image: "103"),
                                         .init(name: "Запад", image: "104"),
                                         .init(name: "Земля", image: "105"),
                                         .init(name: "Вода", image: "106"),
                                         .init(name: "Воздух", image: "107")]
    
    var selectedGroup: AllGroupCellModel?
        
    override func viewDidLoad() {
        super.viewDidLoad()

//        tableView.register(AllGroupTableViewCell.nib(), forCellReuseIdentifier: "AllGroupCell")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return allGroup.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllGroupCell", for: indexPath) as! AllGroupTableViewCell
        let data = allGroup[indexPath.row]
        cell.setData(with: data)
        return cell
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            allGroup.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .middle)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
}



class TestView: UIView {
    
    @IBInspectable var radius: CGFloat = 10 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.setFillColor(UIColor.red.cgColor)
        context.fillEllipse(in: CGRect(x: rect.midX - radius,
                                       y: rect.midY - radius,
                                       width: radius * 2,
                                       height: radius * 2))
        
    }
}

