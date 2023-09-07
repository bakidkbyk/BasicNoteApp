//
//  EditNoteViewModel.swift
//  BasicNoteApp
//
//  Created by Baki Dikbıyık on 31.08.2023.
//

import Foundation

protocol EditNoteViewDataSource {}

protocol EditNoteViewEventSource {}

protocol EditNoteViewProtocol: EditNoteViewDataSource, EditNoteViewEventSource {}

final class EditNoteViewModel: BaseViewModel<EditNoteRouter>, EditNoteViewProtocol {
    
}
