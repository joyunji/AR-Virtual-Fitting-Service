//
//  profileView.swift
//  simulation
//
//  Created by 이다민 on 2022/10/23.
//

import SwiftUI

struct profileView: View {
    
    @Binding var isNavigationBarHidden: Bool
    init(isNavigationBarHidden: Binding<Bool> = .constant(false)){
        _isNavigationBarHidden = isNavigationBarHidden
    }
    
    @State var id: String = ""
    @State var name: String = ""
    @State var email: String = ""
    @State var avatarImg: String = ""
    
    @State var userData: UserData? = nil
    
    
    @State private var showSheet : Bool = false
    @State private var showImagePicker : Bool = false
    @State private var sourceType : UIImagePickerController.SourceType = .camera
    
    @State private var image: UIImage?
    
    var body: some View {
        VStack(alignment: .center){
            Form{
                Section{
                    HStack{
                        Spacer()
                        if userData != nil{
                            AsyncImage(url: URL(string: userData!.avatar)){phase in
                                switch phase{
                                case .empty:
                                    ProgressView()
                                        .frame(width: 200, height: 200, alignment: .center)
                                case .success(let image):
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 200, height: 200, alignment: .center)
                                case .failure:
                                    Image("T-pose")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .padding()
                                        .frame(width: 200, height: 200, alignment: .center)
                                @unknown default:
                                    EmptyView()
                                        .frame(width: 200, height: 200, alignment: .center)
                                }
                            }
                        } else{
                            Image(uiImage: image ?? UIImage(named: "T-pose")!)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding()
                                .frame(width: 300, height: 400, alignment: .center)
                        Spacer()
                        }
                    }
                    HStack{
                        Spacer()
                        Button("Choose Picture"){
                            self.showSheet = true
                        }
                        .actionSheet(isPresented: $showSheet){
                            ActionSheet(title: Text("Select Photo"),
                                        message: Text("T-pose"), buttons: [
                                            .default(Text("Photo Library")){
                                                self.showImagePicker = true
                                                self.sourceType = .photoLibrary
                                            },
                                            .default(Text("Camera")){
                                                self.showImagePicker = true
                                                self.sourceType = .camera
                                            },
                                            .cancel()
                                        ])
                        }
                        Spacer()
                    }.sheet(isPresented: $showImagePicker){
                        ImagePicker(image: $image, isShown: self.$showImagePicker, sourceType: self.sourceType)
                    }
                }
                
                Section{
//                    Text("아이디: \(id)")
//                    Text("이름: \(name)")
//                    Text("이메일: \(email)")
                    Text("아이디: TEST")
                    Text("이름: 이다민")
                    Text("이메일: test@gmail.com")
                }
                .foregroundColor(.black)
                Section{
                    Button {
                        print("새로고침 버튼 클릭")
                    } label: {
                        Text("새로고침")
                    }
                }
            }
        }
        .navigationBarTitle("PROFILE", displayMode: .inline)
        .foregroundColor(Color.brown)
        .onAppear{
            self.isNavigationBarHidden = false
        }
    }
}

struct profileView_Previews: PreviewProvider {
    static var previews: some View {
        profileView()
    }
}
