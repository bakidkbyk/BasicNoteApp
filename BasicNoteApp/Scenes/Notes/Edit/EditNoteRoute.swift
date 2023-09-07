//
//  EditNoteRoute.swift
//  BasicNoteApp
//
//  Created by Baki Dikbıyık on 31.08.2023.
//

protocol EditNoteRoute {
    func pushEditNote()
}

extension EditNoteRoute where Self: RouterProtocol {
    
    func pushEditNote() {
        let router = EditNoteRouter()
        let viewModel = EditNoteViewModel(router: router)
        let viewController = EditNoteViewController(viewModel: viewModel)
        
        let transition = PushTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
