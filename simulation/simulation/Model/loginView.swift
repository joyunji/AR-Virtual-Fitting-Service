//
//  loginView.swift
//  simulation
//
//  Created by 이다민 on 2022/10/22.
//

import SwiftUI
import Firebase

struct loginView: View {
    
    @Binding var isNavigationBarHidden: Bool
    init(isNavigationBarHidden: Binding<Bool> = .constant(false)){
        _isNavigationBarHidden = isNavigationBarHidden
    }
    
    
    @State var emailInput : String = ""
    @State var passwordInput : String = ""
    
    
    @State private var success = false
    @State private var fail = false

    var body: some View {
        VStack{
            Form{
                Section(header: Text("로그인 입력"), content: {
                    TextField("이메일", text: $emailInput).keyboardType(.emailAddress).autocapitalization(.none)
                    SecureField("비밀번호", text: $passwordInput).keyboardType(.default)
                })
                Section{
                    Button {
                        login()
                    } label: {
                        Text("LOGIN")
                    }
                }
                .alert(isPresented: $success){
                    Alert(title: Text("로그인 완료"), message: nil, dismissButton: .default(Text("OK")))
                }
                .alert(isPresented: $fail){
                    Alert(title: Text("오류"), message: Text("다시 입력하시기 바랍니다."), dismissButton: .default(Text("OK")))
                }
                if (success) {
                    NavigationLink("작은 옷장 열기", destination: initView())
                        .foregroundColor(Color.green)
                        .foregroundColor(.green)
                }
            }
        }
        .navigationBarTitle("LOGIN", displayMode: .inline)
//        .fontWeight
        .foregroundColor(Color.brown)
        .onAppear{
            self.isNavigationBarHidden = false
        }
    }
    
    func login() {
        Auth.auth().signIn(withEmail: emailInput, password: passwordInput) { result, error in
            if error != nil {
                print(error!.localizedDescription)
                fail = true
            }
            else {
                success = true
            }
        }
    }
}


struct loginView_Previews: PreviewProvider {
    static var previews: some View {
        loginView()
    }
}
