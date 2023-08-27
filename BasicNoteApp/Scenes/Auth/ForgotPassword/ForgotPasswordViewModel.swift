//
//  ForgotPasswordViewModel.swift
//  BasicNoteApp
//
//  Created by Baki Dikbıyık on 26.08.2023.
//

import Foundation

protocol ForgotPasswordViewDataSource {}

protocol ForgotPasswordViewEventSource {}

protocol ForgotPasswordViewProtocol: ForgotPasswordViewDataSource, ForgotPasswordViewEventSource {}

final class ForgotPasswordViewModel: BaseViewModel<ForgotPasswordRouter>, ForgotPasswordViewProtocol {}

// MARK: - Url
extension ForgotPasswordViewModel {
    
    func sendForgotPasswordRequest(email: String) {
        showLoading?()
        let request = ForgotPasswordRequest(email: email)
        dataProvider.request(for: request) { [weak self] result in
            guard let self = self else { return }
            self.hideLoading?()
            switch result {
            case .success:
                self.showWarningToast?(L10n.Toast.forgotPasswordRequestSuccess)
            case .failure(let error):
                self.showWarningToast?(error.localizedDescription)
            }
        }
    }
}
