//
//  RegistrationPresenter.swift
//  ToDo-SQLite
//
//  Created by Mehmet Ali Demir on 2.02.2023.
//

import Foundation


class RegistrationPresenter : ViewToPresenterRegistrationProtocol {
    func noteSave(note_name: String, note_description: String) {
        registrationInteractor?.noteSave(note_name: note_name, note_description: note_description)
    }
    
    var registrationInteractor: PresenterToInteractorRegistrationProtocol?
    
}
