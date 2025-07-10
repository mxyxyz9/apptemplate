import SwiftUI

public struct RefreshableView: View {
    @Binding public var isRefreshing: Bool
    public let action: () -> Void
    
    public var body: some View {
        GeometryReader { geometry in
            if isRefreshing {
                VStack {
                    Spacer()
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .frame(width: geometry.size.width)
                    Spacer()
                }
            } else {
                Color.clear.onAppear(perform: action)
            }
        }
        .frame(height: isRefreshing ? 50 : 0)
    }
}