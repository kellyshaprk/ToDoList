//
//  JDI_ViewController.swift
//  JustDoIt
//
//  Created by Sehee Park on 2019-11-21.
//  Copyright © 2019 Group5. All rights reserved.
//

import UIKit

class JDI_ViewController: UIViewController {
    //MARK:- Class variables
    var jdiModel = JDI_Model()
    var isEdit = false
    var editToDoData : TodoData?
    var taskNumber: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(!isEdit) {
            delButton.isHidden = true
            doneButton.isHidden = true
        }
        
        if(isEdit) {
            jdiModel.isEdit = true
            navigationItem.title = "Edit"
            delButton.isHidden = false
            doneButton.isHidden = false
            
            addButton.setTitle("Edit", for: .normal)
            // set the title, desc and the dateCh
            titleText.text = editToDoData?.usrTitle
            descText.text = editToDoData?.usrDesc
            
            datePick.date = editToDoData!.usrDate
        }
        
        // Do any additional setup after loading the view.
    }
    
    //MARK:- Outlets
  
    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var datePick: UIDatePicker!
    @IBOutlet weak var descText: UITextView!
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var delButton: UIButton!
    @IBOutlet weak var doneButton: UIButton!
    
    
    @IBAction func addTouched(_ sender: UIButton) {
        let df = DateFormatter()
        df.dateFormat = "dd/MMM/YYYY"
        let usrDate = datePick.date
        let usrTitle = String(titleText.text!)
        let usrDesc = String(descText.text!)

        // Add data and go back to the list controll view
        if (!isEdit) {
            jdiModel.saveToDo(usrTitle: usrTitle, usrDate: usrDate, usrDesc: usrDesc, isDone: "0")
            _ = navigationController?.popViewController(animated: true)
        }
        
        // Edit data and go back to the list controll view
        if(isEdit) {
            jdiModel.editTodo(taskNumber: editToDoData!.taskNum, usrTitle: usrTitle, usrDate: usrDate, usrDesc: usrDesc)
            _ = navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func delTouched(_ sender: UIButton) {
        jdiModel.deleteTodo(taskNumber: editToDoData!.taskNum)
        _ = navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func doneTouched(_ sender: UIButton) {
        jdiModel.doneTodo(taskNumber: editToDoData!.taskNum, isDone: "1")
        _ = navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
