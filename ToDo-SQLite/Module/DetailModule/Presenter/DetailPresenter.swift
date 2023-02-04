//
//  DetailPresenter.swift
//  ToDo-SQLite
//
//  Created by Mehmet Ali Demir on 2.02.2023.
//

import Foundation

class DetailPresenter : ViewToPresenterDetailProtocol  {
    var detailInteractor: PresenterToInteractorDetailProtocol?
    
    func update(note_id: Int, note_name: String, note_description:String) {
        detailInteractor?.update(note_id: note_id, note_name: note_name, note_description: note_description)
    }
  }

