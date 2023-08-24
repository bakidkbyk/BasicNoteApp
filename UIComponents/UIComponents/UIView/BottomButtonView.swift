//
//  BottomButton.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 24.08.2023.
//

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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubViews()
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
