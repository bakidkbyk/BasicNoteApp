//
//  ButtonFactory.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 23.08.2023.
//

public class ButtonFactory {
    
    public enum Style {
        case small
        case large
        
        var height: CGFloat {
            switch self {
            case .small:
                return 17
            case .large:
                return 63
            }
        }
        
        var fontSize: UIFont.FontSize {
            switch self {
            case .small:
                return .large
            case .large:
                return .xLarge
            }
        }
    }
    
    public static func createPrimaryButton(style: Style) -> UIButton {
        let button = UIButtonBuilder()
            .titleFont(.font(.nunitoBold, size: style.fontSize))
            .titleColor(.actionSecondary)
            .backgroundColor(.actionPrimary)
            .cornerRadius(4)
            .build()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: style.height).isActive = true
        button.layer.masksToBounds = true
        button.clipsToBounds = true
        return button
    }
}
