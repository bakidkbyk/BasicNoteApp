//
//  ToastPresenter.swift
//  UIComponents
//
//  Created by Baki Dikbıyık on 21.08.2023.
//

import SwiftEntryKit

public class ToastPresenter {
    
    public static func showWarningToast(text: String, type: Type) {
        var attributes = EKAttributes.topToast
        attributes.entryBackground = .color(color: EKColor(light: .appRed, dark: .appGreen))
        attributes.entranceAnimation = .translation
        attributes.exitAnimation = .translation
        
        let customView = ToastWarningView(text: text)
        SwiftEntryKit.display(entry: customView, using: attributes)
        
        switch type {
        case .success:
            attributes.entryBackground = .color(color: EKColor(light: .appGreen, dark: .appGreen))
        case .fail:
            attributes.entryBackground = .color(color: EKColor(light: .appRed, dark: .appRed))
        }
    }
}

public enum Type {
    case success
    case fail
}
