//
//  NotesViewModel.swift
//  BasicNoteApp
//
//  Created by Baki Dikbıyık on 27.08.2023.
//

import Foundation

protocol NotesViewDataSource {
    func numberOfItemsAt() -> Int
    func cellItemAt(_ indexPath: IndexPath) -> NotesTableViewCellProtocol
}

protocol NotesViewEventSource {}

protocol NotesViewProtocol: NotesViewDataSource, NotesViewEventSource {}

final class NotesViewModel: BaseViewModel<NotesRouter>, NotesViewProtocol {
    
    func numberOfItemsAt() -> Int {
        let cell = cellItems.count
        return cell
    }

    func cellItemAt(_ indexPath: IndexPath) -> NotesTableViewCellProtocol {
        return cellItems[indexPath.row]
    }
    
    private var cellItems: [NotesTableViewCellProtocol] = []
    
}
