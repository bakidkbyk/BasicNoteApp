// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum L10n {

  public enum Register {
    /// Email Adress
    public static let email = L10n.tr("Localizable", "Register.email")
    /// Forgot Password
    public static let forgotPassword = L10n.tr("Localizable", "Register.forgotPassword")
    /// Full Name
    public static let fullName = L10n.tr("Localizable", "Register.fullName")
    /// Already have an account?
    public static let haveAccount = L10n.tr("Localizable", "Register.haveAccount")
    /// Password
    public static let password = L10n.tr("Localizable", "Register.password")
    /// Sign in now
    public static let signInNow = L10n.tr("Localizable", "Register.signInNow")
    /// Sign Up
    public static let signUp = L10n.tr("Localizable", "Register.signUp")
    /// Sign Up
    public static let signUpButton = L10n.tr("Localizable", "Register.signUpButton")
    /// Login or sign up to continue using our app.
    public static let signUpSubTitle = L10n.tr("Localizable", "Register.signUpSubTitle")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    var format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    if let value = Localize.shared.strings[key] {
        format = value
    }
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
