import SwiftUI

public struct SlickLoadingSpinner: View {
    let connectionState: LoadingState
    
    public init(connectionState: LoadingState) {
        self.connectionState = connectionState
    }
    
    public var body: some View {
        switch connectionState {
            case .connecting:
                EndlessSpinner(image: noTypeImage)
            case .success:
                QuarterSpinner(image: noTypeImage)
            case .failure:
                QuarterSpinner(image: noTypeImage)
            case .notStarted:
                QuarterSpinner(image: noTypeImage)
                
        }
    }
    
    private var image: some View {
        switch connectionState {
            case .failure:
                return Image(systemName: "xmark.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.red)
            case .connecting:
                return Image(systemName: "arrow.2.circlepath.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.blue)
            case .success:
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
    
    private var  noTypeImage: AnyView {
        AnyView(image)
    }
    
}

private struct EndlessSpinner: View {
    let image: AnyView
    
    @State var spinning = false
    
    var body: some View {
        image
            .rotationEffect(spinning ? .degrees(180) : .zero)
            .animation(Animation.easeInOut(duration: 0.6).repeatForever(autoreverses: false))
            .onAppear {
                spinning.toggle()
            }
    }
}

private struct QuarterSpinner: View {
    let image: AnyView
    
    @State var turning = true
    
    var body: some View {
        image
            .rotationEffect(turning ? .degrees(90) : .zero)
            .animation(.default)
            .onAppear {
                turning.toggle()
            }
    }
}

struct SlickLoadingSpinner_Previews: PreviewProvider {
    struct IndicatorPreview: View {
        @State var connectionState = LoadingState.notStarted
        
        var body: some View {
            VStack(spacing: 20) {
                SlickLoadingSpinner(connectionState: connectionState)
                Picker("State", selection: $connectionState, content: {
                    ForEach(LoadingState.allCases, id: \.rawValue) { value in
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
                SlickLoadingSpinner(connectionState: .notStarted)
                    .padding()
                SlickLoadingSpinner(connectionState: .connecting)
                    .padding()
                SlickLoadingSpinner(connectionState: .failure)
                    .padding()
                SlickLoadingSpinner(connectionState: .success)
                    .padding()
            }
            .previewLayout(.sizeThatFits)
            .padding()
            HStack {
                SlickLoadingSpinner(connectionState: .notStarted)
                    .padding()
                SlickLoadingSpinner(connectionState: .connecting)
                    .padding()
                SlickLoadingSpinner(connectionState: .failure)
                    .padding()
                SlickLoadingSpinner(connectionState: .success)
                    .padding()
            }
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
        }
    }
}

