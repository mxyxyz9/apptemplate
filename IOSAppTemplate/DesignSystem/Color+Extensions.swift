
import SwiftUI

extension Color {
    static let theme = ColorTheme()
}

struct ColorTheme {
    let background = Color("BackgroundColor")
    let text = Color("TextColor")
    let primaryButton = Color("PrimaryButtonColor")
    let secondaryButton = Color("SecondaryButtonColor")
    let accent = Color("AccentColor")
}

// Monotone Color Palette
// BackgroundColor: #FFFFFF (white)
// TextColor: #000000 (black)
// PrimaryButtonColor: #333333 (dark gray)
// SecondaryButtonColor: #F2F2F2 (light gray)
// AccentColor: #666666 (medium gray)
