//
//  LoginViewController.swift
//  BasicNoteApp
//
//  Created by Baki Dikbıyık on 24.08.2023.
//

import UIKit
import MobilliumBuilders
import UIComponents

final class LoginViewController: BaseViewController<LoginViewModel> {
    
    private let scrollView = UIScrollViewBuilder()
        .build()
    
    private let contentView = UIViewBuilder()
        .build()
    
    private let contentStackView = UIStackViewBuilder()
        .axis(.vertical)
        .spacing(40)
        .build()
    
    private let titleView = TitleView()
    
    private let textFieldStackView = UIStackViewBuilder()
        .axis(.vertical)
        .spacing(16)
        .build()
    
    private let emailTextField = FloatLabelTextField()
    private let passwordTextField = FloatLabelTextField()
    
    private let forgotPasswordcontainerView = UIViewBuilder()
        .build()
    
    private let forgotPasswordButton = UIButtonBuilder()
        .titleFont(.font(.nunitoSemiBold, size: .xLarge))
        .titleColor(.textPrimary)
        .build()
    
    private let registerButton = ButtonFactory.createPrimaryButton(style: .large)
    
    private let loginButtonView = BottomButtonView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureContents()
        setLocalize()
        actionButtonTapped()
        subscribeViewModel()
    }
}

// MARK: - UILayout
extension LoginViewController {
    
    private func addSubviews() {
        addScrollView()
        addContentStackView()
        addLoginButtonView()
    }
    
    private func addScrollView() {
        view.addSubview(scrollView)
        scrollView.edgesToSuperview(excluding: .bottom, usingSafeArea: true)
        
        scrollView.addSubview(contentView)
        
        contentView.edgesToSuperview()
        contentView.widthToSuperview()
        
        contentView.addSubview(contentStackView)
        
        contentStackView.edgesToSuperview(insets: .left(24) + .right(24) + .top(52))
    }
    
    private func addContentStackView() {
        contentStackView.addArrangedSubview(titleView)
        titleView.height(65)
        
        contentStackView.addArrangedSubview(textFieldStackView)
        contentStackView.setCustomSpacing(12, after: textFieldStackView)
        
        textFieldStackView.addArrangedSubview(emailTextField)
        textFieldStackView.addArrangedSubview(passwordTextField)
        
        contentStackView.addArrangedSubview(forgotPasswordcontainerView)
        contentStackView.setCustomSpacing(24, after: forgotPasswordcontainerView)
        
        forgotPasswordcontainerView.addSubview(forgotPasswordButton)
        forgotPasswordButton.edgesToSuperview(excluding: .leading)
        
        contentStackView.addArrangedSubview(registerButton)
        registerButton.height(63)
    }
    
    private func addLoginButtonView() {
        view.addSubview(loginButtonView)
        loginButtonView.centerXToSuperview()
        loginButtonView.leadingToSuperview(relation: .equalOrGreater).constant = 24
        loginButtonView.trailingToSuperview(relation: .equalOrLess).constant = -24
        loginButtonView.topToBottom(of: scrollView).constant = 24
        loginButtonView.bottomToSuperview(usingSafeArea: true).constant = -4
    }
}

// MARK: - Configure Contents
extension LoginViewController {
    
    private func configureContents() {
        view.backgroundColor = .white
        
        emailTextField.autocorrectionType = .no
        emailTextField.autocapitalizationType = .none
        emailTextField.keyboardType = .emailAddress
        
        passwordTextField.autocorrectionType = .no
        passwordTextField.isSecureTextEntry = true
        
        forgotPasswordButton.addTarget(self, action: #selector(forgotPasswordButtonTapped), for: .touchUpInside)
        
        registerButton.addTarget(self, action: #selector(registerButtonAction), for: .touchUpInside)
    }
    
    private func setLocalize() {
        titleView.title = L10n.Login.title
        titleView.subTitle = L10n.Login.subTitle
        emailTextField.title = L10n.Login.email
        passwordTextField.title = L10n.Login.password
        forgotPasswordButton.setTitle(L10n.Login.forgotPassword, for: .normal)
        registerButton.setTitle(L10n.Login.registerButton, for: .normal)
        loginButtonView.infoText = L10n.Login.newUser
        loginButtonView.buttonText = L10n.Login.signUp
    }
}

// MARK: - Actions
extension LoginViewController {
    
    @objc
    func forgotPasswordButtonTapped() {
        viewModel.showForgotPassword()
    }
    
    @objc
    func registerButtonAction() {
        guard let email = emailTextField.text,
              let password = passwordTextField.text else {
            self.showWarningToast(message: L10n.Toast.emptyFields, type: .fail)
            return
        }
        
        let validation = Validation()
        guard validation.isValidEmail(email) else { return }
        guard validation.isValidPassword(password) else { return }
        
        viewModel.sendLoginRequest(email: email, password: password)
    }
    
    func actionButtonTapped() {
        loginButtonView.bottomButtonTapped = { [ weak self] in
            self?.viewModel.showRegister()
        }
    }
}

// MARK: - Subscribe View Model
extension LoginViewController {
    
    func subscribeViewModel() {
        viewModel.loginClosure = { [weak self] in
            guard let self = self else { return }
            self.viewModel.showNotes()
        }
    }
}
