//
//  DetailRouter.swift
//  ToDo-SQLite
//
//  Created by Mehmet Ali Demir on 2.02.2023.
//

import Foundation

class DetailRouter : PresenterToRouterDetailProtocol{
    static func createModule(ref: DetailViewController) {
        ref.detailPresenterObject = DetailPresenter()
        ref.detailPresenterObject?.detailInteractor = DetailInteractor()
    }
}
