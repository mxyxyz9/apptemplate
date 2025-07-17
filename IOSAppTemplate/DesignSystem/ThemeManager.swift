
import SwiftUI

class ThemeManager: ObservableObject {
    @Published var colors = ColorTheme()
    @Published var fonts = FontTheme()
}

struct FontTheme {
    let headline = Font.custom(.bold, size: 24)
    let subheading = Font.custom(.medium, size: 20)
    let body = Font.custom(.regular, size: 16)
    let caption = Font.custom(.regular, size: 12)
}
