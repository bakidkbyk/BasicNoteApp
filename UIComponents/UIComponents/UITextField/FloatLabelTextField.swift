//
//  FloatLabelTextField.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 2.08.2023.
//

public class FloatLabelTextField: UITextField {
    
    private let titleLabel = UILabelBuilder()
        .font(.font(.nunitoBold, size: .xLarge))
        .textColor(.actionPrimary)
        .build()
    
    private var insets: UIEdgeInsets {
        var insets = UIEdgeInsets(top: 10, left: 18, bottom: 0, right: 18)
        if let leftView = leftView {
            insets.left = leftView.frame.width + 10
        }
        return insets
    }
    
    public var title: String? {
        willSet {
            placeholder = nil
            attributedPlaceholder = nil
            titleLabel.text = newValue
            titleLabel.sizeToFit()
        }
    }
    
    public override func textRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: insets)
    }
    
    public override func editingRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: insets)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureContents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureContents()
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        placeholder = nil
        attributedPlaceholder = nil
        setTitlePosition()
        if isFirstResponder || !text!.isEmpty {
            setTitleToTop(animate: true)
            layer.borderColor = UIColor.actionPrimary.cgColor
        } else {
            setTitleToCenter(animate: true)
            layer.borderColor = UIColor.textSecondary.cgColor
        }
    }
}

// MARK: - Configure Contents
extension FloatLabelTextField {
    
    private func configureContents() {
        addSubview(titleLabel)
        translatesAutoresizingMaskIntoConstraints = false
        titleLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        borderStyle = .none
        layer.borderWidth = 1
        layer.cornerRadius = 5
    }
    
    private func setTitlePosition() {
        titleLabel.frame.origin.x = insets.left
        titleLabel.frame.size.width = frame.size.width - insets.left - insets.right
    }
    
    private func configureTitleForTop() {
        let contentHeight = frame.size.height
        let titleHeight = titleLabel.frame.size.height
        titleLabel.font = .font(.nunitoBold, size: .small)
        titleLabel.textColor = .actionPrimary
        titleLabel.frame.origin.y = (contentHeight / 2) - titleHeight
    }
    
    private func configureTitleForCenter() {
        let contentHeight = frame.size.height
        let titleHeight = titleLabel.frame.size.height
        titleLabel.font = .font(.nunitoSemiBold, size: .large)
        titleLabel.textColor = .textSecondary
        titleLabel.frame.origin.y = (contentHeight / 2) - (titleHeight / 2 )
    }
    
    private func setTitleToTop(animate: Bool) {
        guard animate else { return }
        UIView.animate(withDuration: 0.25, delay: 0, options: [.beginFromCurrentState, .curveEaseIn], animations: { [ weak self ] in
            self?.configureTitleForTop()
        }, completion: nil)
    }
    
    private func setTitleToCenter(animate: Bool) {
        guard animate else { return }
        UIView.animate(withDuration: 0.25, delay: 0, options: [.beginFromCurrentState, .curveEaseIn], animations: { [ weak self ] in
            self?.configureTitleForCenter()
        }, completion: nil)
    }
}
