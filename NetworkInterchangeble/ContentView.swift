//
//  ContentView.swift
//  NetworkInterchangeble
//
//  Created by hasan bilgin on 14.11.2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var userViewModel : UserViewModel
    
    init() {
        //localde bizim data gelicek web te uzaktan bağlantı ile gelicek
        self.userViewModel = UserViewModel(service: Localservice())
        //normal uzaktan çekersek burdan
//                self.userViewModel = UserViewModel(service: Webservice())
    }
    
    var body: some View {
        //bu list herzaman id ister ondna dolayı id önemli
        List (userViewModel.userModelList,id: \.id){ user in
            VStack {
                Text(user.name)
                    .font(.title3)
                    .foregroundStyle(.blue)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                Text(user.username)
                    .font(.title3)
                    .foregroundStyle(.green)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                Text(user.email)
                    .font(.title3)
                    .foregroundStyle(.black)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            }
        }.task {
            await  userViewModel.downloadUsers()
        }
    }
}

#Preview {
    ContentView()
}
