//
//  Notes.swift
//  ToDo-SQLite
//
//  Created by Mehmet Ali Demir on 2.02.2023.
//

import Foundation

class Notes {
    var note_id: Int?
    var note_name: String?
    var note_description: String?

    init(note_id: Int, note_name: String, note_description: String) {
        self.note_id = note_id
        self.note_name = note_name
        self.note_description = note_description
    }
}
