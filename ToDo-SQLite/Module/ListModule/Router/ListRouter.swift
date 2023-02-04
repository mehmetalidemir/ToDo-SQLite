//
//  ListRouter.swift
//  ToDo-SQLite
//
//  Created by Mehmet Ali Demir on 2.02.2023.
//

import Foundation

class ListRouter : PresenterToRouaterListProtocol {
    static func createModule(ref: ViewController) {
        let presenter = ListPresenter()
        
        //View
        ref.listPresenterObject = presenter
        
        //Presenter
        ref.listPresenterObject?.listInteractor = ListInteractor()
        ref.listPresenterObject?.listView = ref
        
        //Interactor
        ref.listPresenterObject?.listInteractor?.listPresenter = presenter
    }
}
