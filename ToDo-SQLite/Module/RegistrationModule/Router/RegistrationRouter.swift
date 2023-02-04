//
//  RegistrationRouter.swift
//  ToDo-SQLite
//
//  Created by Mehmet Ali Demir on 2.02.2023.
//

import Foundation

class RegistrationRouter : PresenterToRouterRegistrationProtocol {
    static func createModule(ref: RegistrationViewController) {
        ref.RegistrationPresenterObject = RegistrationPresenter()
        ref.RegistrationPresenterObject?.registrationInteractor = RegistrationInteractor()
    }
}
