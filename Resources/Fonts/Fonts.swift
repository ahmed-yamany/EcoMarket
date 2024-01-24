import UIKit.UIFont

// swiftlint: disable all
/*
To get all system and custom fonts supported in the app
 Poppins
 -- Poppins-Regular
 -- Poppins-Medium
 -- Poppins-SemiBold
 -- Poppins-Bold
for familyName in UIFont.familyNames {
    print (familyName )
    for fontName in UIFont.fontNames (forFamilyName: familyName) {
        print("-- \(fontName)")
    }
}
**/
// MARK: - labels
/// An extension to provide custom fonts
public extension UIFont {
    static var h1: UIFont {
        return .custom(size: 24, weight: .bold)
    }

    static var h2: UIFont {
        return .custom(size: 20, weight: .bold)
    }

    static var h3: UIFont {
        return .custom(size: 16, weight: .semibold)
    }

    static var medium: UIFont {
        return .custom(size: 14, weight: .medium)
    }
    
    static var regular: UIFont {
        return .custom(size: 12, weight: .regular)
    }

    static var small: UIFont {
        return .custom(size: 10, weight: .regular)
    }
    
    /// Returns a custom font with the specified size and weight.
    ///
    /// - Parameters:
    ///   - size: The size of the font in points.
    ///   - weight: The weight of the font.
    /// - Returns: A custom font with the given size and weight.
    static func custom(size: CGFloat, weight: UIFont.Weight) -> UIFont {
        let fontName = self.fontName(forWeight: weight)
        // Attempt to create a font with the specified name and size
        guard let font = UIFont(name: fontName, size: size) else {
            assertionFailure("Unable to get a font with name: \(fontName)")
            return UIFont.systemFont(ofSize: size, weight: weight)
        }
        return font
    }
}

extension UIFont {
    /// Returns the appropriate font name based on the specified weight.
    /// Don't fogtet to update this with the custom family name you provided to the app
    ///
    /// - Parameter weight: The weight of the font.
    /// - Returns: The font name associated with the specified weight.
    static private func fontName(forWeight weight: UIFont.Weight) -> String {
        switch weight {
        case .regular: return "Poppins-Regular"
        case .medium: return "Poppins-Medium"
        case .semibold: return "Poppins-SemiBold"
        case .bold: return "Poppins-Bold"
        default: return "Poppins-Regular"
        }
    }
}
// swiftlint: enable all
