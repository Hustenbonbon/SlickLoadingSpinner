import Foundation
import SwiftUI


public enum LoadingState: String, Equatable, CaseIterable {
    case failure = "wrong"
    case connecting = "connecting"
    case success = "right"
    case notStarted = "notStarted"
}
