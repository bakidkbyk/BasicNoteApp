//
//  RegisterViewController.swift
//  BasicNoteApp
//
//  Created by Baki Dikbıyık on 22.08.2023.
//

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
        .titleFont(.font(.nunitoBold, size: .xLarge))
        .titleColor(.textPrimary)
        .title(L10n.Register.forgotPassword)
        .build()
    
    private let registerButton = ButtonFactory.createPrimaryButton(style: .large)
    
    private let registerButtonView = BottomButtonView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureContents()
        setLocalize()
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
        
        contentStackView.edgesToSuperview(excluding: .bottom, insets: .left(24) + .right(24) + .top(52))
        
    }
    
    private func addContentStackView() {
        contentStackView.addArrangedSubview(titleView)
        titleView.height(65)
        
        contentStackView.addArrangedSubview(textFieldStackView)
        contentStackView.setCustomSpacing(10, after: textFieldStackView)
        
        textFieldStackView.addArrangedSubview(fullNameTextField)
        fullNameTextField.height(53)
        textFieldStackView.addArrangedSubview(emailTextField)
        emailTextField.height(53)
        textFieldStackView.addArrangedSubview(passwordTextField)
        passwordTextField.height(53)
        
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
        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
    }
    
    private func setLocalize() {
        titleView.title = L10n.Register.signUp
        titleView.subTitle = L10n.Register.signUpSubTitle
        fullNameTextField.title = L10n.Register.fullName
        emailTextField.title = L10n.Register.email
        passwordTextField.title = L10n.Register.password
        registerButton.setTitle(L10n.Register.signUpButton, for: .normal)
        registerButtonView.infoText = L10n.Register.haveAccount
        registerButtonView.buttonText = L10n.Register.signInNow
    }
}

// MARK: - Actions
extension RegisterViewController {
    
    @objc
    func registerButtonTapped() {
        guard let fullName = fullNameTextField.text,
              let email = emailTextField.text,
              let password = passwordTextField.text else {
            self.showWarningToast(message: L10n.Toast.emptyFields)
            return
        }
        
        let validation = Validation()
        guard validation.isValidEmail(email) else { return }
        guard validation.isValidPassword(password) else { return }
        
        viewModel.sendRegisterRequest(fullName: fullName, email: email, password: password)
    }
}

// MARK: Subscribe View Model
extension RegisterViewController {
    
    func subscribeViewModel() {
        viewModel.registerSuccess = { [weak self] in
            guard let self = self else { return }
        }
    }
}
