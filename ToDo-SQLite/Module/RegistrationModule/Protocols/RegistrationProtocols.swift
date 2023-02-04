//
//  RegistrationProtocols.swift
//  ToDo-SQLite
//
//  Created by Mehmet Ali Demir on 2.02.2023.
//

import Foundation

protocol ViewToPresenterRegistrationProtocol {
    var registrationInteractor:PresenterToInteractorRegistrationProtocol? {get set}
    
    func noteSave(note_name:String,note_description:String)
}

protocol PresenterToInteractorRegistrationProtocol{
    func noteSave(note_name:String,note_description:String)
}

protocol PresenterToRouterRegistrationProtocol  {
    static func createModule(ref:RegistrationViewController)
}
