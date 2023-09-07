//
//  EditNotesInputView.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 31.08.2023.
//

import UIKit

public class EditNotesInputView: UIView {
    
    private let titleTextView = UITextViewBuilder()
        .font(.font(.nunitoExtraBold, size: .xxLarge))
        .textColor(.textPrimary)
        .isScrollEnabled(false)
        .textContainerInset(.init(top: 0, left: 0, bottom: 0, right: 0))
        .build()
    
    private let subTitleTextView = UITextViewBuilder()
        .font(.font(.nunitoBold, size: .xLarge))
        .textColor(.textSecondary)
        .isScrollEnabled(false)
        .textContainerInset(.init(top: 0, left: 0, bottom: 0, right: 0))
        .build()
    
    private let sendButton = ButtonFactory.createPrimaryButton(style: .small)
    
    private let sendButtonClosure: ((String, String) -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureContents()
        addSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureContents()
        addSubViews()
    }
    
    public var titleTextViewText: String? {
        willSet {
            titleTextView.text = newValue
        }
    }
    
    public var subTitleTextViewText: String? {
        willSet {
            subTitleTextView.text = newValue
        }
    }
    
    private func configureContents() {
        titleTextView.delegate = self
        sendButton.setTitle(L10n.EditNotes.saveButton, for: .normal)
        sendButton.addTarget(self, action: #selector(sendButtonTapped), for: .touchUpInside)
    }
}

// MARK: - UILayout
extension EditNotesInputView {
    
    private func addSubViews() {
        addSubview(titleTextView)
        titleTextView.edgesToSuperview()
    }
}

// MARK: - Actions
extension EditNotesInputView {
    
    @objc
    func sendButtonTapped() {
        titleTextViewText = titleTextView.text
        subTitleTextViewText = subTitleTextView.text
        sendButtonClosure?(titleTextViewText ?? "", subTitleTextViewText ?? "")
    }
}

// MARK: - UITextView Delegate
extension EditNotesInputView: UITextViewDelegate {
    
}
