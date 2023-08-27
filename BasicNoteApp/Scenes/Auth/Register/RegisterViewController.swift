//
//  RegisterViewController.swift
//  BasicNoteApp
//
//  Created by Baki Dikbıyık on 22.08.2023.
//

import UIComponents

final class RegisterViewController: BaseViewController<RegisterViewModel> {
    
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
    
    private let fullNameTextField = FloatLabelTextField()
    private let emailTextField = FloatLabelTextField()
    private let passwordTextField = FloatLabelTextField()
    
    private let forgotpasswordContainerView = UIViewBuilder()
        .build()
    
    private let forgotPasswordButton = UIButtonBuilder()
        .titleFont(.font(.nunitoSemiBold, size: .xLarge))
        .titleColor(.textPrimary)
        .build()
    
    private let registerButton = ButtonFactory.createPrimaryButton(style: .large)
    
    private let registerButtonView = BottomButtonView()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureContents()
        setLocalize()
        subscribeViewModel()
        actionButtonTapped()
    }
    
    override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
         navigationItem.setHidesBackButton(true, animated: false)
     }
     
     override func viewDidDisappear(_ animated: Bool) {
         super.viewDidDisappear(animated)
         navigationItem.setHidesBackButton(true, animated: false)
     }
}

// MARK: - UILayout
extension RegisterViewController {
    
    private func addSubviews() {
        addScrollView()
        addContentStackView()
        addRegisterButtonView()
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
        contentStackView.setCustomSpacing(10, after: textFieldStackView)
        
        textFieldStackView.addArrangedSubview(fullNameTextField)
        textFieldStackView.addArrangedSubview(emailTextField)
        textFieldStackView.addArrangedSubview(passwordTextField)
       
        contentStackView.addArrangedSubview(forgotpasswordContainerView)
        contentStackView.setCustomSpacing(24, after: forgotpasswordContainerView)
        
        forgotpasswordContainerView.addSubview(forgotPasswordButton)
        forgotPasswordButton.edgesToSuperview(excluding: .leading)
        
        contentStackView.addArrangedSubview(registerButton)
        registerButton.height(63)
    }
    
    private func addRegisterButtonView() {
        view.addSubview(registerButtonView)
        registerButtonView.centerXToSuperview()
        registerButtonView.topToBottom(of: scrollView).constant = 24
        registerButtonView.bottomToSuperview(usingSafeArea: true).constant = -4
        registerButtonView.leadingToSuperview(relation: .equalOrGreater).constant = 24
        registerButtonView.trailingToSuperview(relation: .equalOrLess).constant = -24
    }
}

// MARK: - Configure Contents
extension RegisterViewController {
    
    private func configureContents() {
        view.backgroundColor = .white
       
        fullNameTextField.autocorrectionType = .no
        fullNameTextField.autocapitalizationType = .none
        
        emailTextField.autocorrectionType = .no
        emailTextField.autocapitalizationType = .none
        emailTextField.keyboardType = .emailAddress
        
        passwordTextField.autocorrectionType = .no
        passwordTextField.isSecureTextEntry = true
        
        forgotPasswordButton.addTarget(self, action: #selector(forgotPasswordButtonClicked), for: .touchUpInside)
        
        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        
    }
    
    private func setLocalize() {
        titleView.title = L10n.Register.signUp
        titleView.subTitle = L10n.Register.signUpSubTitle
        fullNameTextField.title = L10n.Register.fullName
        emailTextField.title = L10n.Register.email
        passwordTextField.title = L10n.Register.password
        forgotPasswordButton.setTitle(L10n.Register.forgotPassword, for: .normal)
        registerButton.setTitle(L10n.Register.signUpButton, for: .normal)
        registerButtonView.infoText = L10n.Register.haveAccount
        registerButtonView.buttonText = L10n.Register.signInNow
    }
}

// MARK: - Actions
extension RegisterViewController {
    
    @objc
    func forgotPasswordButtonClicked() {
        viewModel.showForgotPassword()
    }
    
    @objc
    func registerButtonTapped() {
        guard let fullName = fullNameTextField.text,
              let email = emailTextField.text,
              let password = passwordTextField.text else {
            self.showWarningToast(message: L10n.Toast.emptyFields, type: .fail)
            return
        }
        
        let validation = Validation()
        guard validation.validateFullName(fullName) else { return }
        guard validation.isValidEmail(email) else { return }
        guard validation.isValidPassword(password) else { return }
        
        viewModel.sendRegisterRequest(fullName: fullName, email: email, password: password)
    }
    
    func actionButtonTapped() {
        registerButtonView.bottomButtonTapped = { [weak self] in
            guard let self = self else { return }
            self.viewModel.showLogin()
        }
    }
}

// MARK: Subscribe View Model
extension RegisterViewController {
    
    func subscribeViewModel() {
        viewModel.registerSuccess = { [weak self] in
            guard let self = self else { return }
            self.viewModel.showLogin()
        }
    }
}
