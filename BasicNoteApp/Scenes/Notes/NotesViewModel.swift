//
//  NotesViewModel.swift
//  BasicNoteApp
//
//  Created by Baki Dikbıyık on 27.08.2023.
//

import Foundation

protocol NotesViewDataSource {}

protocol NotesViewEventSource {}

protocol NotesViewProtocol: NotesViewDataSource, NotesViewEventSource {}

final class NotesViewModel: BaseViewModel<NotesRouter>, NotesViewProtocol {
    
}
