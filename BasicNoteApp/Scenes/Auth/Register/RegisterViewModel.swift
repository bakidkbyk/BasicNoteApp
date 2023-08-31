//
//  RegisterViewModel.swift
//  BasicNoteApp
//
//  Created by Baki Dikbıyık on 22.08.2023.
//

import UIComponents

protocol RegisterViewDataSource {}

protocol RegisterViewEventSource {
    var registerSuccess: VoidClosure? { get set }
}

protocol RegisterViewProtocol: RegisterViewDataSource, RegisterViewEventSource {
    func showLogin()
}

final class RegisterViewModel: BaseViewModel<RegisterRouter>, RegisterViewProtocol {
    
    func showLogin() {
        router.close()
    }
    
    func showForgotPassword() {
        router.pushForgotPassword()
    }
    
    var registerSuccess: VoidClosure?
}

// MARK: - Url
extension RegisterViewModel {
    
    func sendRegisterRequest(fullName: String, email: String, password: String) {
        showLoading?()
        let request = RegisterRequest(fullName: fullName, email: email, password: password)
        dataProvider.request(for: request) { [weak self] result in
            guard let self = self else { return }
            self.hideLoading?()
            switch result {
            case .success:
                self.registerSuccess?()
                self.showSuccessToast?(L10n.Toast.success)
            case .failure(let error):
                self.showWarningToast?(error.localizedDescription)
            }
        }
    }
}
