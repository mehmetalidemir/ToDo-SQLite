//
//  ListProtocols.swift
//  ToDo-SQLite
//
//  Created by Mehmet Ali Demir on 2.02.2023.
//

import Foundation


//View - Presenter - Interactor

//Main Protocols
protocol ViewToPresenterListProtocol {
    var listInteractor: PresenterToInteractorListProtocol? { get set }
    var listView: PresenterToViewListProtocol? { get set }

    func uploadNotes()
    func searchNote(searchWord: String)
    func deleteNote(note_id: Int)

}

protocol PresenterToInteractorListProtocol {
    var listPresenter: InteractorToPresenterListProtocol? { get set }
    func uploadNotes()
    func searchNote(searchWord: String)
    func deleteNote(note_id: Int)
}

//Transporter Protocols
protocol InteractorToPresenterListProtocol {
    func sendDataToPresenter(noteList: [Notes])

}

protocol PresenterToViewListProtocol {
    func sendDataToView(noteList: [Notes])
}

//Router Protocol
protocol PresenterToRouaterListProtocol {
    static func createModule(ref: ViewController)
}
