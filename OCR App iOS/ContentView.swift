import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Tab = .home
    @State private var image: UIImage? = nil
    @State private var results: String = ""

    enum Tab {
        case camera
        case home
        case settings
    }

    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $selectedTab) {
                CameraView(image: $image, results: $results)
                    .tag(Tab.camera)
                
                HomeView()
                    .tag(Tab.home)
                
                SettingsView()
                    .tag(Tab.settings)
            }
            .edgesIgnoringSafeArea(.top)
            
            Spacer()
            
            HStack {
                TabBarButton(systemImage: "camera", tab: .camera, selectedTab: $selectedTab)
                TabBarButton(systemImage: "house", tab: .home, selectedTab: $selectedTab)
                TabBarButton(systemImage: "gear", tab: .settings, selectedTab: $selectedTab)
            }
            .frame(width: 300)
            .padding(.vertical, 10)
            .background(
                RoundedRectangle(cornerRadius: 100)
                    .foregroundColor(.black)
                    .frame(height: 70)
                    .shadow(color: Color.purple, radius: 75)
                    .overlay(
                        RoundedRectangle(cornerRadius: 100)
                            .stroke(
                                LinearGradient(gradient: Gradient(stops: [
                                    .init(color: Color.white.opacity(0.1), location: 0),
                                    .init(color: Color.white.opacity(0.3), location: 0.2),
                                    .init(color: Color.white.opacity(0.6), location: 0.5),
                                    .init(color: Color.white.opacity(0.3), location: 0.8),
                                    .init(color: Color.white.opacity(0.1), location: 1)
                                ]), startPoint: .topLeading, endPoint: .bottomTrailing),
                                lineWidth: 1
                            )
                    )
            )
            .padding(.bottom, 20)
        }
        .background(Color.black.edgesIgnoringSafeArea(.all).opacity(1))
    }
}

struct TabBarButton: View {
    let systemImage: String
    let tab: ContentView.Tab
    @Binding var selectedTab: ContentView.Tab

    var body: some View {
        Button(action: {
            selectedTab = tab
        }) {
            Image(systemName: systemImage)
                .font(.system(size: 24))
                .foregroundColor(selectedTab == tab ? .purple : Color.white.opacity(0.5))
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
