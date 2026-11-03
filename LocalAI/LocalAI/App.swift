import SwiftUI
import LLM

@main
struct LocalAIApp: App {
    @Environment(\.scenePhase) private var scenePhase
    @State private var model: LLM?

    var body: some Scene {
        WindowGroup {
            ChatView(model: $model)
                .onAppear {
                    loadModel()
                }
                .onChange(of: scenePhase) { _, newPhase in
                    if newPhase == .inactive || newPhase == .background {
                        model?.stop()
                    }
                }
        }
    }

    private func loadModel() {
        Task {
            do {
                let model = try await LLM(from: HuggingFaceModel(
                    "bartowski/Llama-3.2-3B-Instruct-GGUF",
                    quantization: .Q4_K_M
                ), maxTokenCount: 2048)
                await MainActor.run {
                    self.model = model
                }
            } catch {
                print("Failed to load model: \(error)")
            }
        }
    }
}