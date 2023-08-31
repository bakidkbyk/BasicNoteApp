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
                return 41
            case .large:
                return 63
            }
        }
        
        var width: CGFloat {
            switch self {
            case .small:
                return 142
            case .large:
                return 327
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
            .titleFont(.font(.nunitoSemiBold, size: style.fontSize))
            .titleColor(.actionSecondary)
            .backgroundColor(.actionPrimary)
            .cornerRadius(4)
            .build()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: style.height).isActive = true
        button.widthAnchor.constraint(equalToConstant: style.width).isActive = true
        button.layer.masksToBounds = true
        button.clipsToBounds = true
        return button
    }
}
