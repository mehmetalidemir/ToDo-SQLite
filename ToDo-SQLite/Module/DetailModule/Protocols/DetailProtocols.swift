//
//  DetailProtocols.swift
//  ToDo-SQLite
//
//  Created by Mehmet Ali Demir on 2.02.2023.
//

import Foundation

protocol PresenterToInteractorDetailProtocol {
    func update(note_id: Int, note_name: String, note_description: String)
}

protocol ViewToPresenterDetailProtocol {
    var detailInteractor:PresenterToInteractorDetailProtocol? {get set}

}
protocol PresenterToRouterDetailProtocol {
    static func createModule(ref: DetailViewController)
}
