//
//  UserViewModel.swift
//  NetworkInterchangeble
//
//  Created by hasan bilgin on 15.11.2023.
//

import Foundation

struct UserModelList {
    let user : UserModel
    var id : Int {user.id}
    var name : String {user.name}
    var username : String {user.username}
    var email : String {user.email}
}

class UserViewModel : ObservableObject{
    
    @Published var userModelList = [UserModelList]()
    
    //Webservice mi yada Localservicemi  girerek olmasın şöleki prokol yazıcaz
    //let webservice = Webservice()
    //yorum yapotık çünkü direk NetworkService alıp viewde localmi webmi giricez budada o atıcak
    private var service : NetworkService
    
    init(service : NetworkService) {
        self.service = service
    }
    
    func downloadUsers() async {
        
        var resource = ""
        if service.type == "Webservice" {
            resource = Constants.Urls.usersExtension
        }else{
            resource = Constants.Paths.baseUrl
        }
        
        do {
        
            //let users = try await webservice.download(Contants.Urls.atilhocaUrl)
            //artıkın hepsişni serviceden alcak
            //let users = try await webservice.download(Contants.Urls.usersExtension)
            //let users = try await service.download(Contants.Urls.usersExtension)
            let users = try await service.download(resource)
            DispatchQueue.main.async {
                self.userModelList = users.map(UserModelList.init)
            }
        }catch {
            print(error)
        }
    }
}
