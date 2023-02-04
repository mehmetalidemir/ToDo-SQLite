//
//  DetailInteractor.swift
//  ToDo-SQLite
//
//  Created by Mehmet Ali Demir on 2.02.2023.
//

import Foundation

class DetailInteractor: PresenterToInteractorDetailProtocol {

    let db: FMDatabase?

    init() {
        let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let databaseURL = URL(fileURLWithPath: targetPath).appendingPathComponent("todo.sqlite")
        db = FMDatabase(path: databaseURL.path)
    }

    func update(note_id: Int, note_name: String, note_description: String) {
        db?.open()

        do {
            try db!.executeUpdate("UPDATE notes SET note_name = ? , note_description = ? WHERE note_id = ?", values: [note_name, note_description, note_id])
        } catch {
            print(error.localizedDescription)
        }

        db?.close()
    }

}
