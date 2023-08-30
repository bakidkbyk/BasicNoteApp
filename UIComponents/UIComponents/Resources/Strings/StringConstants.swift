// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum L10n {

  public enum Forgot {
    /// Email Adress
    public static let email = L10n.tr("Localizable", "Forgot.email")
    /// Reset Password
    public static let registerButton = L10n.tr("Localizable", "Forgot.registerButton")
    /// Confirm your email and we’llsend\nthe instructions.
    public static let subTitle = L10n.tr("Localizable", "Forgot.subTitle")
    /// Forgot Password?
    public static let title = L10n.tr("Localizable", "Forgot.title")
  }

  public enum Login {
    /// Email Adress
    public static let email = L10n.tr("Localizable", "Login.email")
    /// Forgot Password?
    public static let forgotPassword = L10n.tr("Localizable", "Login.forgotPassword")
    /// New user?
    public static let newUser = L10n.tr("Localizable", "Login.newUser")
    /// Password
    public static let password = L10n.tr("Localizable", "Login.password")
    /// Login
    public static let registerButton = L10n.tr("Localizable", "Login.registerButton")
    /// Sign Up Now
    public static let signUp = L10n.tr("Localizable", "Login.signUp")
    /// Login or sign up to continue using our app.
    public static let subTitle = L10n.tr("Localizable", "Login.subTitle")
    /// Login
    public static let title = L10n.tr("Localizable", "Login.title")
  }

  public enum Notes {
    /// + Add Note
    public static let addNoteButton = L10n.tr("Localizable", "Notes.addNoteButton")
    /// İptal
    public static let cancel = L10n.tr("Localizable", "Notes.cancel")
    /// Sil
    public static let delete = L10n.tr("Localizable", "Notes.delete")
    /// Düzenle
    public static let edit = L10n.tr("Localizable", "Notes.edit")
    /// Search...
    public static let searchBarPlaceHolder = L10n.tr("Localizable", "Notes.searchBarPlaceHolder")
  }

  public enum Register {
    /// Email Adress
    public static let email = L10n.tr("Localizable", "Register.email")
    /// Forgot Password?
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

  public enum Toast {
    /// Lütfen geçerli bir email adresi giriniz
    public static let emptyEmail = L10n.tr("Localizable", "Toast.emptyEmail")
    /// Lütfen boş alanları doldurunuz
    public static let emptyFields = L10n.tr("Localizable", "Toast.emptyFields")
    /// Lütfen geçerli bir isim giriniz
    public static let emptyFullName = L10n.tr("Localizable", "Toast.emptyFullName")
    /// Lütfen geçerli bir parola giriniz
    public static let emptyPassword = L10n.tr("Localizable", "Toast.emptyPassword")
    /// Lütfen Tekrar Deneyiniz
    public static let fail = L10n.tr("Localizable", "Toast.fail")
    /// Şifre yenileme isteğiniz başarılı bir şekilde yollanmıştır
    public static let forgotPasswordRequestSuccess = L10n.tr("Localizable", "Toast.forgotPasswordRequestSuccess")
    /// Giriş Başarılı
    public static let success = L10n.tr("Localizable", "Toast.success")
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
