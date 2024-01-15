/*
 Local Service eklemek için
 -Json çıktısını kopyalanır ve json dosyası oluşturmamız gerekiyor ondan dolayı terminal açılır. Desktop gelinir cd Desktop ile . Ardındop touch users.json diye users adında json dosya uzantılı dosya oluşturmuş oluyoruz ve masaüstüne oluşturucxaktır. open users.json denirse o dosya açılır yada normal tıklanarakta açılabilir istenilen programlada açılabilir önemli değil. kopyalanan veri direk yapıştırılır içine ve kaydedilir sonra proje klasörüne atılır içine.
 */

import Foundation

class Localservice : NetworkService {
    var type: String = "Localservice"
    
    
    
    func download(_ resource : String)  async throws -> [UserModel]{
        
        // dosya yolu için
        guard let path = Bundle.main.path(forResource: resource, ofType: "json") else {
            //enum local error diye oluşturulabilir diye
            fatalError("Resource not found")
        }
        
        let data = try Data(contentsOf: URL(filePath: path))
        
        return try JSONDecoder().decode([UserModel].self, from: data)
        
    }
}
