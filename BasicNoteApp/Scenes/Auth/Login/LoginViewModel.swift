//
//  LoginViewModel.swift
//  BasicNoteApp
//
//  Created by Baki Dikbıyık on 24.08.2023.
//

import KeychainSwift

protocol LoginViewDataSource {}

protocol LoginViewEventSource {
    var loginClosure: VoidClosure? { get set }
}

protocol LoginViewProtocol: LoginViewDataSource, LoginViewEventSource {}

final class LoginViewModel: BaseViewModel<LoginRouter>, LoginViewProtocol {
    
    var loginClosure: VoidClosure?
    var keychainSwift = KeychainSwift()
    
    func showForgotPassword() {
        router.pushForgotPassword()
    }
    
    func showRegister() {
        router.pushRegister()
    }
    
    func showNotes() {
        router.presentNotes()
    }
}

// MARK: - Url
extension LoginViewModel {
    
    func sendLoginRequest(email: String, password: String) {
        showLoading?()
        let request = LoginRequest(email: email, password: password)
        dataProvider.request(for: request) { [weak self] result in
            guard let self = self else { return }
            self.hideLoading?()
            switch result {
            case .success(let response):
                self.keychainSwift.set(response.data?.accessToken ?? "", forKey: Keychain.token)
                self.showWarningToast?(L10n.Toast.success)
                self.loginClosure?()
            case .failure(let error):
                self.showWarningToast?(error.localizedDescription)
            }
        }
    }
}
