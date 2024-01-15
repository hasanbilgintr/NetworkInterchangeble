//
//  NetworkService.swift
//  NetworkInterchangeble
//
//  Created by hasan bilgin on 20.11.2023.
//

import Foundation

//protokol yazarak  ve iki servisede miras verdik ardından download fonksiyonunu sorunlu kılmış olduk
protocol NetworkService {
    func download(_ resource : String)  async throws -> [UserModel]
    
    //localmi webmi bunla kontrol edicez yada enumda oluşturalbilir
    var type : String {get}
}
