// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// Email
  internal static let email = L10n.tr("Localizable", "email", fallback: "Email")
  /// Login
  internal static let login = L10n.tr("Localizable", "login", fallback: "Login")
  /// Password
  internal static let password = L10n.tr("Localizable", "password", fallback: "Password")
  /// Sign Up
  internal static let signup = L10n.tr("Localizable", "signup", fallback: "Sign Up")
  internal enum Address {
    /// You must fill all fields
    internal static let alerMessage = L10n.tr("Localizable", "address.alerMessage", fallback: "You must fill all fields")
    /// Add Address
    internal static let title = L10n.tr("Localizable", "address.title", fallback: "Add Address")
    internal enum AddButton {
      /// Add
      internal static let title = L10n.tr("Localizable", "address.addButton.title", fallback: "Add")
    }
  }
  internal enum App {
    /// Localizable.strings
    ///   EcoMarket
    /// 
    ///   Created by Ahmed Yamany on 03/01/2024.
    internal static let name = L10n.tr("Localizable", "app.name", fallback: "EcoMarket")
  }
  internal enum Cart {
    /// Your cart is empty!
    internal static let empty = L10n.tr("Localizable", "cart.empty", fallback: "Your cart is empty!")
    /// My Cart
    internal static let title = L10n.tr("Localizable", "cart.title", fallback: "My Cart")
  }
  internal enum Credit {
    /// You Successfully Added Your Card
    internal static let success = L10n.tr("Localizable", "credit.success", fallback: "You Successfully Added Your Card")
    internal enum AddButton {
      /// Add Card
      internal static let label = L10n.tr("Localizable", "credit.addButton.label", fallback: "Add Card")
    }
    internal enum CancelButton {
      /// Cancel
      internal static let label = L10n.tr("Localizable", "credit.cancelButton.label", fallback: "Cancel")
    }
    internal enum Card {
      /// Card Details
      internal static let label = L10n.tr("Localizable", "credit.card.label", fallback: "Card Details")
    }
    internal enum Cvv {
      /// CVV
      internal static let placeholder = L10n.tr("Localizable", "credit.cvv.placeholder", fallback: "CVV")
    }
    internal enum Details {
      /// CARD HOLDER NAME
      internal static let cardHolder = L10n.tr("Localizable", "credit.details.cardHolder", fallback: "CARD HOLDER NAME")
      /// CARD NUMBER
      internal static let cardNumber = L10n.tr("Localizable", "credit.details.cardNumber", fallback: "CARD NUMBER")
      /// VALID THRU
      internal static let valid = L10n.tr("Localizable", "credit.details.valid", fallback: "VALID THRU")
    }
    internal enum Expdate {
      /// Exp date
      internal static let placeholder = L10n.tr("Localizable", "credit.expdate.placeholder", fallback: "Exp date")
    }
    internal enum Header {
      /// Add New Card
      internal static let label = L10n.tr("Localizable", "credit.header.label", fallback: "Add New Card")
    }
    internal enum Holder {
      /// Card holder name
      internal static let placeholder = L10n.tr("Localizable", "credit.holder.placeholder", fallback: "Card holder name")
    }
    internal enum Number {
      /// Card number
      internal static let placeholder = L10n.tr("Localizable", "credit.number.placeholder", fallback: "Card number")
    }
  }
  internal enum Home {
    internal enum Theme2 {
      /// Our EcoMarket App
      internal static let subtitle = L10n.tr("Localizable", "home.theme2.subtitle", fallback: "Our EcoMarket App")
      /// Wellcome,
      internal static let title = L10n.tr("Localizable", "home.theme2.title", fallback: "Wellcome,")
    }
  }
  internal enum Login {
    /// Continue with Apple
    internal static let apple = L10n.tr("Localizable", "login.apple", fallback: "Continue with Apple")
    /// Continue with Facebook
    internal static let facebook = L10n.tr("Localizable", "login.facebook", fallback: "Continue with Facebook")
    /// Continue with Google
    internal static let google = L10n.tr("Localizable", "login.google", fallback: "Continue with Google")
    /// please login or sign up to continue our app
    internal static let subtitle = L10n.tr("Localizable", "login.subtitle", fallback: "please login or sign up to continue our app")
    /// Wellcome!
    internal static let title = L10n.tr("Localizable", "login.title", fallback: "Wellcome!")
    internal enum Email {
      /// fscreation441@gmail.com
      internal static let placeholder = L10n.tr("Localizable", "login.email.placeholder", fallback: "fscreation441@gmail.com")
    }
    internal enum Password {
      /// *******
      internal static let placeholder = L10n.tr("Localizable", "login.password.placeholder", fallback: "*******")
    }
  }
  internal enum Logout {
    /// Log Out
    internal static let title = L10n.tr("Localizable", "logout.title", fallback: "Log Out")
  }
  internal enum Product {
    internal enum Details {
      /// Add to cart
      internal static let cart = L10n.tr("Localizable", "product.details.cart", fallback: "Add to cart")
    }
  }
  internal enum Profile {
    /// 22 Year
    internal static let ageText = L10n.tr("Localizable", "profile.ageText", fallback: "22 Year")
    /// Age   
    internal static let ageTitle = L10n.tr("Localizable", "profile.ageTitle", fallback: "Age   ")
    /// Fscreation441@gmai.com
    internal static let emailText = L10n.tr("Localizable", "profile.emailText", fallback: "Fscreation441@gmai.com")
    /// Email
    internal static let emailTitle = L10n.tr("Localizable", "profile.emailTitle", fallback: "Email")
    /// Gender
    internal static let genderTitle = L10n.tr("Localizable", "profile.genderTitle", fallback: "Gender")
    /// Fscreation
    internal static let nameText = L10n.tr("Localizable", "profile.nameText", fallback: "Fscreation")
    /// Name
    internal static let nameTitle = L10n.tr("Localizable", "profile.nameTitle", fallback: "Name")
  }
  internal enum Search {
    /// Search....
    internal static let placeholder = L10n.tr("Localizable", "search.placeholder", fallback: "Search....")
  }
  internal enum Shipping {
    /// You must add an address
    internal static let alerMessage = L10n.tr("Localizable", "shipping.alerMessage", fallback: "You must add an address")
    /// Shipping
    internal static let title = L10n.tr("Localizable", "shipping.title", fallback: "Shipping")
    internal enum PaymentButton {
      /// Proceed To Payment
      internal static let title = L10n.tr("Localizable", "shipping.paymentButton.title", fallback: "Proceed To Payment")
    }
  }
  internal enum Signup {
    /// Confirm Password
    internal static let confirmPassword = L10n.tr("Localizable", "signup.confirmPassword", fallback: "Confirm Password")
    /// Email
    internal static let email = L10n.tr("Localizable", "signup.email", fallback: "Email")
    /// Password
    internal static let password = L10n.tr("Localizable", "signup.password", fallback: "Password")
    /// Create an new account
    internal static let subtitle = L10n.tr("Localizable", "signup.subtitle", fallback: "Create an new account")
    /// By creating an account you have to agree
    /// with our them & conduction.
    internal static let terms = L10n.tr("Localizable", "signup.terms", fallback: "By creating an account you have to agree\nwith our them & conduction.")
    /// Sign Up
    internal static let title = L10n.tr("Localizable", "signup.title", fallback: "Sign Up")
    /// User Name
    internal static let username = L10n.tr("Localizable", "signup.username", fallback: "User Name")
    internal enum Username {
      /// Ferrin
      internal static let placeholder = L10n.tr("Localizable", "signup.username.placeholder", fallback: "Ferrin")
    }
  }
  internal enum Splash {
    internal enum Button {
      /// Login
      internal static let login = L10n.tr("Localizable", "splash.button.login", fallback: "Login")
      /// Sign Up
      internal static let signup = L10n.tr("Localizable", "splash.button.signup", fallback: "Sign Up")
    }
  }
  internal enum Success {
    /// You have successfully registered in
    /// our app and start working in it.
    internal static let message = L10n.tr("Localizable", "success.message", fallback: "You have successfully registered in\nour app and start working in it.")
    /// Successful!
    internal static let title = L10n.tr("Localizable", "success.title", fallback: "Successful!")
    internal enum Button {
      /// Start Shopping
      internal static let title = L10n.tr("Localizable", "success.button.title", fallback: "Start Shopping")
    }
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
