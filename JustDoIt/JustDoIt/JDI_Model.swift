//
//  JDI_Model.swift
//  JustDoIt
//
//  Created by Sehee Park on 2019-11-21.
//  Copyright © 2019 Group5. All rights reserved.
//

import Foundation

class JDI_Model {
    var isEdit = false
    
    func saveToDo(usrTitle: String, usrDate: Date, usrDesc: String, isDone: String) {
        var numberOfLists = UserDefaults.standard.integer(forKey: Constants.LIST_NUM)
        
        if(!isEdit) {
            numberOfLists += 1
            
            UserDefaults.standard.set(numberOfLists, forKey: Constants.LIST_NUM)
            UserDefaults.standard.set(usrTitle, forKey: Constants.USR_TITLE + String(numberOfLists))
            UserDefaults.standard.set(usrDate, forKey: Constants.USR_DATE + String(numberOfLists))
            UserDefaults.standard.set(usrDesc, forKey: Constants.USR_DESC + String(numberOfLists))
            UserDefaults.standard.set(isDone, forKey: Constants.IS_DONE + String(numberOfLists))
        }
    }
    
    func doneTodo(taskNumber: Int, isDone: String) {
        if (isEdit)
        {
            UserDefaults.standard.set(isDone, forKey: Constants.IS_DONE + String(taskNumber))       
        }
    }
    
    func editTodo (taskNumber: Int, usrTitle: String, usrDate: Date, usrDesc: String) {
        if(isEdit) {
            UserDefaults.standard.set(usrTitle, forKey: Constants.USR_TITLE + String(taskNumber))
            UserDefaults.standard.set(usrDate, forKey: Constants.USR_DATE + String(taskNumber))
            UserDefaults.standard.set(usrDesc, forKey: Constants.USR_DESC + String(taskNumber))
        }
    }
    
    func deleteTodo (taskNumber: Int) {
        if (isEdit) {
            //UserDefaults.standard.removeObject(forKey: "Key")
            UserDefaults.standard.removeObject(forKey: Constants.USR_TITLE + String(taskNumber))
            UserDefaults.standard.removeObject(forKey: Constants.USR_DATE + String(taskNumber))
            UserDefaults.standard.removeObject(forKey: Constants.USR_DESC + String(taskNumber))
        }
    }
}
