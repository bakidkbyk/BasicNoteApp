//
//  ForgotPasswordViewController.swift
//  BasicNoteApp
//
//  Created by Baki Dikbıyık on 26.08.2023.
//

final class ForgotPasswordViewController: BaseViewController<ForgotPasswordViewModel> {
    
    private let scrollView = UIScrollViewBuilder()
        .build()
    
    private let contentView = UIViewBuilder()
        .build()
    
    private let contentStackView = UIStackViewBuilder()
        .axis(.vertical)
        .spacing(40)
        .build()
    
    private let titleView = TitleView()
    private let emailTextField = FloatLabelTextField()
    private let registerButton = ButtonFactory.createPrimaryButton(style: .large)
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureContents()
        setLocalize()
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
extension ForgotPasswordViewController {
    
    private func addSubviews() {
        addScrollView()
        addContentStackView()
    }
    
    private func addScrollView() {
        view.addSubview(scrollView)
        scrollView.edgesToSuperview()
        
        scrollView.addSubview(contentView)
        
        contentView.edgesToSuperview()
        contentView.widthToSuperview()
        
        contentView.addSubview(contentStackView)
        
        contentStackView.edgesToSuperview(insets: .left(24) + .right(24) + .top(52))
    }
    
    private func addContentStackView() {
        contentStackView.addArrangedSubview(titleView)
        titleView.height(83)
        
        contentStackView.addArrangedSubview(emailTextField)
        contentStackView.setCustomSpacing(24, after: emailTextField)
        
        contentStackView.addArrangedSubview(registerButton)
    }
}

// MARK: - Configure Contents
extension ForgotPasswordViewController {
    
    private func configureContents() {
        view.backgroundColor = .white
        
        emailTextField.autocorrectionType = .no
        emailTextField.autocapitalizationType = .none
        emailTextField.keyboardType = .emailAddress
        
        registerButton.addTarget(self, action: #selector(registerButtonClicked), for: .touchUpInside)
    }
    
    private func setLocalize() {
        titleView.title = L10n.Forgot.title
        titleView.subTitle = L10n.Forgot.subTitle
        emailTextField.title = L10n.Forgot.email
        registerButton.setTitle(L10n.Forgot.registerButton, for: .normal)
    }
}

// MARK: - Actions
extension ForgotPasswordViewController {
    
    @objc
    func  registerButtonClicked() {
        
        guard let email = emailTextField.text else { return }
        
        let validation = Validation()
        guard validation.isValidEmail(email) else { return }
        
        self.viewModel.sendForgotPasswordRequest(email: email)
    }
}
