//
//  Webservice.swift
//  NetworkInterchangeble
//
//  Created by hasan bilgin on 14.11.2023.
//

import Foundation

enum NetworkError : Error {
    case invalidUrl
    case invalidServerResponse
}

class Webservice : NetworkService{
    var type: String = "Webservice"
    
    //_ resource : String) _ burda kullanılsada opsiyonel anlamında kullanılmasada sorun çıkarmaz anlamında
    func download(_ resource : String)  async throws -> [UserModel]{
        guard let url = URL(string: resource) else{
            //            return
            throw NetworkError.invalidUrl
        }
        
        let (data,response) = try await URLSession.shared.data(from: url)
        
        //404 bulunamadı
        //500 sunucu hatası
        //httpResponse cevap gelmiş ve atanmışsa ve statusCodesi 200 ise sorun yok değilse bunu çalıştır  throw NetworkError.invalidServerResponse
        guard let httpResponse = response as? HTTPURLResponse , httpResponse.statusCode == 200 else {
                throw NetworkError.invalidServerResponse
        }
        
        return try JSONDecoder().decode([UserModel].self, from: data)
    }
}


