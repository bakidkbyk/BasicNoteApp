//
//  BottomButton.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 24.08.2023.
//

import Utilities

public class BottomButtonView: UIView {
    
    private let stackView = UIStackViewBuilder()
        .axis(.horizontal)
        .spacing(3)
        .build()
    
    private let infoLabel = UILabelBuilder()
        .textColor(.textSecondary)
        .font(.font(.nunitoBold, size: .xLarge))
        .build()
    
    private let registerButton = UIButtonBuilder()
        .titleColor(.actionPrimary)
        .titleFont(.font(.nunitoBold, size: .xLarge))
        .build()
    
    public var bottomButtonTapped: VoidClosure?
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        configureContens()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubViews()
        configureContens()
    }
    
    public var infoText: String? {
        didSet {
            infoLabel.text = infoText
        }
    }
    
    public var buttonText: String? {
        didSet {
            registerButton.setTitle(buttonText, for: .normal)
        }
    }
    
}

// MARK: - AddSubviews
extension BottomButtonView {
    
    private func addSubViews() {
        addSubview(stackView)
        stackView.edgesToSuperview()
        stackView.addArrangedSubview(infoLabel)
        stackView.addArrangedSubview(registerButton)
    }
}

// MARK: - Configure Contents
extension BottomButtonView {
    
    private func configureContens() {
        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
    }
}

// MARK: - Actions
extension BottomButtonView {
    
    @objc
    func registerButtonTapped() {
        self.bottomButtonTapped?()
    }
}
