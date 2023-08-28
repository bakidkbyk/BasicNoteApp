//
//  NotesRoute.swift
//  BasicNoteApp
//
//  Created by Baki Dikbıyık on 27.08.2023.
//

protocol NotesRoute {
    func presentNotes()
}

extension NotesRoute where Self: RouterProtocol {
    
    func presentNotes() {
        let router = NotesRouter()
        let viewModel = NotesViewModel(router: router)
        let viewController = NotesViewController(viewModel: viewModel)
        
        let transition = ModalTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
