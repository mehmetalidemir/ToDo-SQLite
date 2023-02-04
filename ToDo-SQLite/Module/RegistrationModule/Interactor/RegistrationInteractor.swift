//
//  RegistrationInteractor.swift
//  ToDo-SQLite
//
//  Created by Mehmet Ali Demir on 2.02.2023.
//

import Foundation

class RegistrationInteractor : PresenterToInteractorRegistrationProtocol {
    
    let db:FMDatabase?
    
    init(){
        let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let databaseURL = URL(fileURLWithPath: targetPath).appendingPathComponent("todo.sqlite")
        db = FMDatabase(path: databaseURL.path)
    }
    
    func noteSave(note_name: String, note_description: String) {
        db?.open()
        
        do{
            try db!.executeUpdate("INSERT INTO notes (note_name,note_description) VALUES (?,?)", values: [note_name, note_description])
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
}

