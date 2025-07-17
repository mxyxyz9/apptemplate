
import SwiftUI

extension Font {
    static func custom(_ style: FontStyle, size: CGFloat) -> Font {
        return .custom(style.rawValue, size: size)
    }
}

enum FontStyle: String {
    case regular = "Inter-Regular"
    case medium = "Inter-Medium"
    case bold = "Inter-Bold"
}
