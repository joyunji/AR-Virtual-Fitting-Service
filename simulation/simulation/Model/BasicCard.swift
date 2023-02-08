//
//  BasicCard.swift
//  simulation
//
//  Created by 이다민 on 2022/10/12.
//

import SwiftUI




struct BasicCard: View{
    
    var l_image: String
    var l_name: String
    var r_image: String
    var r_name: String

    
    var body: some View{
        HStack{
            ZStack(alignment: .bottomTrailing){
                // 왼쪽
                VStack{
                    Image(l_image)
                        .resizable()
                        .frame(width: 180, height: 180)
                        .overlay(
                            Rectangle()
                                .stroke(lineWidth: 1)
                                .foregroundColor(Color("lightGreen"))
                        )
                    Text(l_name)
                        .font(.system(size: 15))
                        .padding(.bottom, 5)
                }
                
                // 버튼
                Button {
                    print("1")
                    UnityManager.shared.launchUnity()

                } label: {
                    Image(systemName: "plus")
                        .fontWeight(.bold)
                        .font(.system(size: 25))
                        .foregroundColor(Color.white)
                }
                .frame(width: 30, height: 30)
                .background(Color("Brown"))
                .clipShape(RoundedRectangle(cornerRadius: 100))
                .padding(.trailing, 6)
                .offset(y:-20)
            }
            
            
            // 오른쪽
            ZStack(alignment: .bottomTrailing){
                VStack{
                    Image(r_image)
                        .resizable()
                        .frame(width: 180, height: 180)
                        .overlay(
                            Rectangle()
                                .stroke(lineWidth: 1)
                                .foregroundColor(Color("lightGreen"))
                        )
                    Text(r_name)
                        .font(.system(size: 15))
                        .padding(.bottom, 5)
                }
                
                // 버튼
                Button {
                    print("1")
                    UnityManager.shared.launchUnity()

                } label: {
                    Image(systemName: "plus")
                        .fontWeight(.bold)
                        .font(.system(size: 25))
                        .foregroundColor(Color.white)
                }
                .frame(width: 30, height: 30)
                .background(Color("Brown"))
                .clipShape(RoundedRectangle(cornerRadius: 100))
                .padding(.trailing, 6)
                .offset(y:-20)
            }
        }
    }
}
struct BasicCard_Previews: PreviewProvider {
    static var previews: some View {
        BasicCard(l_image:"1",
                  l_name:"Clothes 1",
                  r_image:"2",
                  r_name:"Clothes 2")
    }
}
