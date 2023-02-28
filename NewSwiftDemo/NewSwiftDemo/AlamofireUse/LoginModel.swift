import Foundation

struct LoginModel: Codable  {
    
    var token: String
    var user: User
}

struct User: Codable {
    
    var id: String
    var mobile: String
    var userName: String?
    var url: String?
    
    init(id: String, mobile: String) {
        self.id = id
        self.mobile = mobile
    }
}
