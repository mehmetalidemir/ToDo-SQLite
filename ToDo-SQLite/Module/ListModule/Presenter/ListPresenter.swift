//
//  ListPresenter.swift
//  ToDo-SQLite
//
//  Created by Mehmet Ali Demir on 2.02.2023.
//

import Foundation

class ListPresenter: ViewToPresenterListProtocol {
    var listInteractor: PresenterToInteractorListProtocol?
    var listView: PresenterToViewListProtocol?
    
    func uploadNotes(){
        listInteractor?.uploadNotes()
    }
    func searchNote(searchWord: String) {
        listInteractor?.searchNote(searchWord:searchWord)
    }
    
    func `deleteNote`(note_id: Int) {
        listInteractor?.deleteNote(note_id: note_id)
    }
}

extension ListPresenter: InteractorToPresenterListProtocol {
    func sendDataToPresenter(noteList: [Notes]) {
        listView?.sendDataToView(noteList: noteList)
    }
}
