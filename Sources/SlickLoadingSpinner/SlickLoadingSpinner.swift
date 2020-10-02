import SwiftUI

public struct SlickLoadingSpinner: View {
    @Binding var connectionState: State
    
    public init(connectionState: Binding<State>) {
        _connectionState = connectionState
    }
    
    public var body: some View {
        connectionState.image
            .rotationEffect(connectionState == .connecting ? .degrees(180) : .zero)
            .animation(connectionState == .connecting ? Animation.easeInOut(duration: 0.6).repeatForever(autoreverses: false) : .easeInOut(duration: 0.5))
    }
    
    public enum State: String, Equatable, CaseIterable {
        case wrong = "wrong"
        case connecting = "connecting"
        case right = "right"
        case notStarted = "notStarted"
        
        public var image: some View {
            switch self {
                case .wrong:
                    return Image(systemName: "xmark.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.red)
                case .connecting:
                    return Image(systemName: "arrow.2.circlepath.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.blue)
                case .right:
                    return Image(systemName: "checkmark.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.green)
                case .notStarted:
                    return Image(systemName: "ellipsis.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.gray)
            }
        }
    }
}

struct SlickLoadingSpinner_Previews: PreviewProvider {
    struct IndicatorPreview: View {
        @State var connectionState = SlickLoadingSpinner.State.notStarted
        
        var body: some View {
            VStack(spacing: 20) {
                SlickLoadingSpinner(connectionState: $connectionState)
                Picker("State", selection: $connectionState, content: {
                    ForEach(SlickLoadingSpinner.State.allCases, id: \.rawValue) { value in
                        Text(value.rawValue).tag(value)
                    }
                }).pickerStyle(SegmentedPickerStyle())
            }
        }
    }
    
    static var previews: some View {
        Group {
            IndicatorPreview()
                .previewLayout(.sizeThatFits)
                .padding()
            HStack {
                SlickLoadingSpinner(connectionState: .constant(.notStarted))
                    .padding()
                SlickLoadingSpinner(connectionState: .constant(.connecting))
                    .padding()
                SlickLoadingSpinner(connectionState: .constant(.wrong))
                    .padding()
                SlickLoadingSpinner(connectionState: .constant(.right))
                    .padding()
            }
            .previewLayout(.sizeThatFits)
            .padding()
            HStack {
                SlickLoadingSpinner(connectionState: .constant(.notStarted))
                    .padding()
                SlickLoadingSpinner(connectionState: .constant(.connecting))
                    .padding()
                SlickLoadingSpinner(connectionState: .constant(.wrong))
                    .padding()
                SlickLoadingSpinner(connectionState: .constant(.right))
                    .padding()
            }
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
        }
    }
}

