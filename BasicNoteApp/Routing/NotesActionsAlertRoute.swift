//
//  notesActionsAlertRoute.swift
//  BasicNoteApp
//
//  Created by Baki Dikbıyık on 30.08.2023.
//

protocol NotesActionsAlertRoute {
    func notesActions(editAction: VoidClosure?, deleteAction: VoidClosure?)
}

extension NotesActionsAlertRoute where Self: RouterProtocol {
    
    func notesActions(editAction: VoidClosure?, deleteAction: VoidClosure?) {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let edit = UIAlertAction(title: L10n.Notes.edit, style: .destructive) { _ in
            editAction?()
        }
        
        let delete = UIAlertAction(title: L10n.Notes.delete, style: .destructive) { _ in
            deleteAction?()
        }
        
        let cancel = UIAlertAction(title: L10n.Notes.cancel, style: .cancel)
        
        let transition = ModalTransition()
        
        alertController.addAction(edit)
        alertController.addAction(delete)
        alertController.addAction(cancel)
        
        open(alertController, transition: transition)
    }
}
