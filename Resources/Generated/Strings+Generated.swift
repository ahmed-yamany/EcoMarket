// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  internal enum App {
    /// Localizable.strings
    ///   EcoMarket
    /// 
    ///   Created by Ahmed Yamany on 03/01/2024.
    internal static let name = L10n.tr("Localizable", "app.name", fallback: "EcoMarket")
  }
  internal enum Success {
    /// You have successfully registered in
    /// our app and start working in it.
    internal static let message = L10n.tr("Localizable", "success.message", fallback: "You have successfully registered in\nour app and start working in it.")
    /// Successful!
    internal static let title = L10n.tr("Localizable", "success.title", fallback: "Successful!")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
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
