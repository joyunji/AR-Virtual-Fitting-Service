//
//  initView.swift
//  simulation
//
//  Created by 이다민 on 2022/10/22.
//

import SwiftUI

struct initView: View {
    
    @Binding var isNavigationBarHidden: Bool
    init(isNavigationBarHidden: Binding<Bool> = .constant(false)){
        _isNavigationBarHidden = isNavigationBarHidden
    }
    
    var body: some View {
        ScrollView{
            VStack{
                BasicCard(l_image:"robot", // 로봇
                          l_name:"TEST",
                          r_image:"9",
                          r_name:"Sweater")
                
                BasicCard(l_image:"11",
                          l_name:"Cardigan",
                          r_image:"7",
                          r_name:"Hoodie")
                
                BasicCard(l_image:"10",
                          l_name:"Blue Jacket",
                          r_image:"2",
                          r_name:"Jumper")
                
                BasicCard(l_image:"3",
                          l_name:"Leather Jacket(W)",
                          r_image:"4",
                          r_name:"Leather Jumper")
                
                BasicCard(l_image:"5",
                          l_name:"Windbreaker",
                          r_image:"6",
                          r_name:"Leather Jacket(M)")
            }
        }
        .onAppear{ self.isNavigationBarHidden = false }
        .navigationBarTitle("작은옷장", displayMode: .inline)
            .navigationBarItems(
//                leading:
//                     NavigationLink(destination: Text("메뉴창")){
//                         Image(systemName: "line.horizontal.3")
//                             .font(.system(size:25))
//                             .foregroundColor(Color.black)
//                     },
                 trailing:
                    NavigationLink(destination: profileView(isNavigationBarHidden:
                                                                self.$isNavigationBarHidden)){
                         Image(systemName: "person.crop.circle.fill")
                             .font(.system(size:25))
                             .foregroundColor(Color.black)
                     }
            )
        
             
    }
}

struct initView_Previews: PreviewProvider {
    static var previews: some View {
        initView()
    }
}
