//
//  TitleView.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 22.08.2023.
//

public class TitleView: UIView {
    
    private let stackView = UIStackViewBuilder()
        .axis(.vertical)
        .spacing(16)
        .build()
    
    private let titleLabel = UILabelBuilder()
        .textColor(.textPrimary)
        .font(.font(.nunitoSemiBold, size: .xxLarge))
        .textAlignment(.center)
        .build()
    
    private let subTitleLabel = UILabelBuilder()
        .textColor(.textSecondary)
        .font(.font(.nunitoBold, size: .xLarge))
        .textAlignment(.center)
        .numberOfLines(0)
        .build()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubviews()
    }
    
    public var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    
    public var subTitle: String? {
        didSet {
            subTitleLabel.text = subTitle
        }
    }
}

// MARK: - AddSubView
extension TitleView {
    
    private func addSubviews() {
        addSubview(stackView)
        stackView.edgesToSuperview()
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(subTitleLabel)
    }
}
