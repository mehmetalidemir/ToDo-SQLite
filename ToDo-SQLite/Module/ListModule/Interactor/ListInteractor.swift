//
//  ListInteractor.swift
//  ToDo-SQLite
//
//  Created by Mehmet Ali Demir on 2.02.2023.
//

import Foundation

class ListInteractor: PresenterToInteractorListProtocol {
    var listPresenter: InteractorToPresenterListProtocol?

    let db:FMDatabase?

    init() {
        let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let databaseURL = URL(fileURLWithPath: targetPath).appendingPathComponent("todo.sqlite")
        db = FMDatabase(path: databaseURL.path)
    }

    func uploadNotes() {
        var list = [Notes]()

        db?.open()

        do {
            let rs = try db!.executeQuery("SELECT * FROM notes", values: nil)

            while rs.next() {
                let note_id = Int(rs.string(forColumn: "note_id"))!
                let note_name = rs.string(forColumn: "note_name")!
                let note_description = rs.string(forColumn: "note_description")!

                let note = Notes(note_id: note_id, note_name: note_name, note_description: note_description)
                list.append(note)
            }

            listPresenter?.sendDataToPresenter(noteList: list)
        } catch {
            print(error.localizedDescription)
        }

        db?.close()
    }
    
    func searchNote(searchWord: String) {
        var list = [Notes]()

        db?.open()

        do {
            let rs = try db!.executeQuery("SELECT * FROM notes WHERE note_name like ?", values: ["%\(searchWord)%"])

            while rs.next() {
                let note_id = Int(rs.string(forColumn: "note_id"))!
                let note_name = rs.string(forColumn: "note_name")!
                let note_description = rs.string(forColumn: "note_description")!

                let note = Notes(note_id: note_id, note_name: note_name, note_description: note_description)
                list.append(note)
            }

            listPresenter?.sendDataToPresenter(noteList: list)
        } catch {
            print(error.localizedDescription)
        }

        db?.close()
        
    }
    
    func deleteNote(note_id:Int) {
        db?.open()

        do {
            try db!.executeUpdate("DELETE FROM notes WHERE note_id = ?", values: [note_id])
            uploadNotes()
        } catch {
            print(error.localizedDescription)
        }

        db?.close()
    }

}
