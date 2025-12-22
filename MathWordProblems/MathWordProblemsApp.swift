import SwiftUI

@main

struct MathWordProblemsApp: App {
    @AppStorage("userLoginDetail") private var userLoginDetail: String = ""
    var body: some Scene {
        WindowGroup {
            Group {
                if userLoginDetail.isEmpty {
                    LoginView()
                } else {
                    DifficultySelectionView()
                }
            }
        }
    }
}
