//
//  ContentView.swift
//  simulation
//
//  Created by 이다민 on 2022/10/12.
//

import SwiftUI

struct ContentView: View {

    @State var isNavigationBarHidden : Bool = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0){
                // 테스트 -----------------------------------------------
//                // 로봇
//                Button {
//                    UnityManager.shared.launchUnity()
//                    let message = UnityMessage(gameObjectName: "HumanBodyTracker",
//                                               functionName: "SetText",
//                                               message: "1")
//                    UnityManager.shared.sendMessageToUnity(message)
//                } label: {
//                    Text("로봇")
//                        .fontWeight(.bold)
//                        .font(.system(size: 25))
//                }
//
//                Spacer()
//
//                // 빨간옷
//                Button {
//                    UnityManager.shared.launchUnity()
//                    let message = UnityMessage(gameObjectName: "HumanBodyTracker",
//                                               functionName: "SetText",
//                                               message: "2")
//                    UnityManager.shared.sendMessageToUnity(message)
//                } label: {
//                    Text("빨간옷")
//                        .fontWeight(.bold)
//                        .font(.system(size: 25))
//                }
                // ------------------------------------------------------
                
                
                Image(systemName: "lock.fill")
                    .font(.system(size: 120))
                    .padding(40)
                
                NavigationLink(destination: loginView(), label: {
                    HStack{
                        Spacer()
                        Text("LOGIN")
                        Spacer()
                    }
                    .padding()
                    .background(Color.brown)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
                })
                .padding([.bottom], 10)
            
                NavigationLink(destination: joinView(), label: {
                    HStack{
                        Spacer()
                        Text("SIGN UP")
                        Spacer()
                    }
                    .padding()
                    .background(Color.brown)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
                })
                Spacer().frame(height: 40)
                
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
