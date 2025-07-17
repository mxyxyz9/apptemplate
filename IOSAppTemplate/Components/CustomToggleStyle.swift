
import SwiftUI

struct CustomToggleStyle: ToggleStyle {
    @EnvironmentObject var theme: ThemeManager

    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            Spacer()
            Rectangle()
                .frame(width: 51, height: 31)
                .foregroundColor(configuration.isOn ? theme.colors.accent : theme.colors.secondaryButton)
                .cornerRadius(16)
                .overlay(
                    Circle()
                        .frame(width: 27, height: 27)
                        .foregroundColor(theme.colors.background)
                        .padding(2)
                        .offset(x: configuration.isOn ? 10 : -10)
                )
                .onTapGesture {
                    withAnimation(.spring()) {
                        configuration.isOn.toggle()
                    }
                }
        }
    }
}
