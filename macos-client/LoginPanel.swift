//
//  LoginPanel.swift
//  macos-client
//
//  Created by Tobias Hegemann on 05.02.21.
//
import SwiftUI

struct LoginPanel: View {
    @EnvironmentObject var settings: LoginSettings
    
    var SignIn: (_ email: String, _ password: String) -> Void
        
    var body: some View {
        VStack {
            VStack {
                Image("Logo")
                    .padding(.bottom, 20)
                
                Text("Please sign into your digital-stage.org account")
                    .fontWeight(.semibold)
                
                TextField("Email address", text: self.$settings.email)
                    .font(.title)
                    .cornerRadius(5.0)
                SecureField("Password", text: self.$settings.password)
                    .font(.title)
                    .cornerRadius(5.0)
                    .padding(.bottom, 10)
                
                if !self.settings.error.isEmpty {
                    Text(self.settings.error)
                }
                
                Button("Login", action: {
                    self.SignIn(self.settings.email, self.settings.password)
                })
                
                if #available(OSX 11.0, *) {
                    Link("No account? Sign up", destination: URL(string: "https://test.digital-stage.org/account/signup")!)
                } else {
                    Text("No account? Visit https://test.digital-stage.org to sign up!")
                }
            }
            Divider()
            HStack {
                Spacer()
                Button("Close application", action: {exit(0)})
            }
        }
        .padding(.all, 20)
    }
}

#if DEBUG
struct LoginPanel_Previews: PreviewProvider {
    static var previews: some View {
        LoginPanel(SignIn: { (_, _) in
        }).environmentObject(LoginSettings())
    }
}
#endif
