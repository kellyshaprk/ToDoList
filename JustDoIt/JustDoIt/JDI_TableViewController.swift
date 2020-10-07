//
//  JDI_TableViewController.swift
//  JustDoIt
//
//  Created by Sehee Park on 2019-11-21.
//  Copyright © 2019 Group5. All rights reserved.
//

import UIKit

class JDI_TableViewController: UITableViewController {

    var todoDataArray = [TodoData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       loadData()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func viewWillAppear(_ animated:Bool) {
        super.viewWillAppear(animated)
        
        loadData()
        tableView.reloadData()
    }
    // MARK: - Table view data source

    func loadData() {
        /*
         //delete all the data
        UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)

        UserDefaults.standard.synchronize()
        */
        todoDataArray = [TodoData]()
        
        let numberOfLists = UserDefaults.standard.integer(forKey: Constants.LIST_NUM)
        
        //for i in (0..<numberOfLists).reversed() {
        for i in (0..<numberOfLists) {
            if (UserDefaults.standard.string(forKey: Constants.USR_TITLE + String(i + 1)) != nil) {
                let usrTitle = UserDefaults.standard.string(forKey: Constants.USR_TITLE + String(i + 1))!
                let usrDate = UserDefaults.standard.object(forKey: Constants.USR_DATE + String(i + 1)) as! Date
                let usrDesc = UserDefaults.standard.string(forKey: Constants.USR_DESC + String(i + 1))!
                let isDone = UserDefaults.standard.string(forKey: Constants.IS_DONE + String(i + 1))!
                
                let todoData = TodoData(taskNum: i+1, usrTitle: usrTitle, usrDate: usrDate, usrDesc: usrDesc, isDone: isDone)
                    
                todoDataArray.append(todoData)
            }
        }
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let numberOfLists = todoDataArray.count
        
        return numberOfLists
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "JDI_tablecell", for: indexPath) as! JDI_TableViewCell

        // cell number 'i"
        let i = indexPath.row
        let todoData = todoDataArray[i]
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        let formattedDateTime = dateFormatter.string(from: todoData.usrDate)
        
        cell.dateLabel.text = formattedDateTime
        if (todoData.isDone == "0") {
            cell.todoLabel.text = todoData.usrTitle
        }
        if (todoData.isDone != "0") {
            //cell.todoLabel.font = UIFont.italicSystemFont(ofSize: 14.0)
            let stringValue = todoData.usrTitle
            let attrString = NSMutableAttributedString(string: stringValue)
            let style = NSMutableParagraphStyle()
            attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: style, range: NSRange(location: 0, length: stringValue.count))
            attrString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attrString.length))
            attrString.addAttribute(NSAttributedString.Key.kern, value: 2, range: NSMakeRange(0, attrString.length))
            cell.todoLabel.attributedText = attrString
            
        }
        
        cell.todoData = todoData
        cell.taskNumber = i
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let identifier = segue.identifier
        
        if (identifier == "add") {
            return
        }
        
        let whichCell = sender as! JDI_TableViewCell
        let destinationView = segue.destination as! JDI_ViewController
        
        destinationView.isEdit = true
        destinationView.editToDoData = whichCell.todoData
        
        destinationView.taskNumber = whichCell.taskNumber
    }
}

struct TodoData {
    var taskNum: Int
    var usrTitle: String
    var usrDate : Date
    var usrDesc : String
    var isDone: String
}
