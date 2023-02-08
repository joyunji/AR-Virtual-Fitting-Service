//
//  joinView.swift
//  simulation
//
//  Created by 이다민 on 2022/10/22.
//

import SwiftUI
import Firebase

struct joinView: View {
    @State var nameInput : String = ""
    @State var emailInput : String = ""
    @State var passwordInput : String = ""
    @State var passwordCheckInput : String = ""
    
    @State private var success = false
    @State private var fail = false
    @State private var pwError = false
    
    var body: some View {
        NavigationView{
            VStack{
                Form{
                    // 이름
                    Section(header: Text("이름"), content: {
                        TextField("이름", text: $nameInput).keyboardType(.default)
                    })
                    // 이메일
                    Section(header: Text("이메일"), content: {
                        TextField("이메일", text: $emailInput).keyboardType(.emailAddress).autocapitalization(.none)
                    })
                    // 비밀번호
                    Section(header: Text("비밀번호 (6글자 이상)"), content: {
                        SecureField("비밀번호", text: $passwordInput).keyboardType(.default)
                        SecureField("비밀번호 확인", text: $passwordCheckInput).keyboardType(.default)
                    })
                    // 버튼
                    Section{
                        Button(action:{
                            if passwordInput == passwordCheckInput {
                                register()
                            }
                            else {
                                pwError = true
                            }
                        }, label: {
                            Text("Sign Up")
                        })
                    }
                    .alert(isPresented: $pwError){
                        Alert(title: Text("비밀번호 오류"), message: Text("두 정보가 일치하지 않습니다."), dismissButton: .default(Text("OK")))
                    }
                    .alert(isPresented: $fail){
                        Alert(title: Text("오류"), message: Text("기존 회원이거나, 형식이 올바르지 않습니다."), dismissButton: .default(Text("OK")))
                    }
                    .alert(isPresented: $success){
                        Alert(title: Text("회원가입 완료"), message: nil, dismissButton: .default(Text("OK")))
                    }
                }
            }
            .navigationBarTitle("Welcom To 작은옷장!", displayMode: .inline)
            .fontWeight(.bold)
            .foregroundColor(Color.brown)
        }
    }
    
    func register() {
        Auth.auth().createUser(withEmail: emailInput, password: passwordInput) { result, error in
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

struct joinView_Previews: PreviewProvider {
    static var previews: some View {
        joinView()
    }
}
