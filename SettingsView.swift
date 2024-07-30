import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.purple, Color.black, Color.black]),
                               startPoint: .top,
                               endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 20) {
                    VStack(spacing: 15) {
                        NavigationLink(destination: PrivacyView()) {
                            SettingOptionView(icon: "lock", title: "    Privacy")
                        }
                        NavigationLink(destination: AboutView()) {
                            SettingOptionView(icon: "info.circle", title: "    About")
                        }
                        NavigationLink(destination: HelpView()) {
                            SettingOptionView(icon: "questionmark.circle", title: "    Help & Support")
                        }
                    }
                    .padding()
                    .background(Color.black.opacity(0.3))
                    .cornerRadius(36)
                    
                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Settings")
        }
    }
}

struct SettingOptionView: View {
    var icon: String
    var title: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 25, height: 25)
                .foregroundColor(.white)
            
            Text(title)
                .foregroundColor(.white)
                .font(.headline)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.white)
        }
        .padding()
        .padding(.horizontal)
        .background(Color.black.opacity(0.2))
        .cornerRadius(100)
    }
}

struct PrivacyView: View {
    @State private var enableAnalytics = true
    @State private var enableDataCollection = false
    
    var body: some View {
        Form {
            Section(header: Text("Privacy Settings")) {
                Toggle(isOn: $enableAnalytics) {
                    Text("Enable Analytics")
                }
                
                Toggle(isOn: $enableDataCollection) {
                    Text("Enable Data Collection")
                }
            }
        }
        .navigationBarTitle("Privacy")
    }
}

struct AboutView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("About This App")
                .font(.title)
            
            Text("Version 1.0")
                .foregroundColor(.gray)
            
            Text("This version contains the foundations of OCRadar. New features will be pushed after the public release of the app.")
                .foregroundColor(.gray)
                .multilineTextAlignment(.leading)
        }
        .padding()
        .navigationBarTitle("About")
    }
}

struct HelpView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Help & Support")
                .font(.title)
            
            Text("Contact Us:")
                .foregroundColor(.gray)
            
            Button(action: {
                
            }) {
                Text("support@ocradar.com")
                    .foregroundColor(.blue)
            }
        }
        .padding()
        .navigationBarTitle("Help & Support")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
