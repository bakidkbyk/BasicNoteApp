//
//  RegisterRoute.swift
//  BasicNoteApp
//
//  Created by Baki Dikbıyık on 22.08.2023.
//

protocol RegisterRoute {
    func presentRegister()
}

extension RegisterRoute where Self: RouterProtocol {
    
    func presentRegister() {
        let router = RegisterRouter()
        let viewModel = RegisterViewModel(router: router)
        let viewController = RegisterViewController(viewModel: viewModel)
        
        let transition = ModalTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
