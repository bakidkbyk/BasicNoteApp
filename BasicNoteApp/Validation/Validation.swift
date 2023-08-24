//
//  Validation.swift
//  BasicNoteApp
//
//  Created by Baki Dikbıyık on 23.08.2023.
//

public class Validation {
    
    func validateFullName(_ fullName: String) -> Bool {
        guard fullName.count > 5, fullName.count < 255 else {
            ToastPresenter.showWarningToast(text: L10n.Toast.emptyFullName)
            return false
        }
        return true
    }
   
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        
        guard emailPred.evaluate(with: email) else {
            ToastPresenter.showWarningToast(text: "Lütfen geçerli bir email adresi giriniz.")
            return false
        }
        return true
    }
    
    func isValidPassword(_ password: String) -> Bool {
        guard password.count > 5 else {
            ToastPresenter.showWarningToast(text: "Şifreniz en az 6 karaterden oluşmalıdır.")
            return false
        }
        return true
    }
}
