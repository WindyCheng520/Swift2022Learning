import UIKit

func encode<T>(of model: T) throws ->Data where T: Codable {
    let encoder = JSONEncoder()
    encoder.outputFormatting = .prettyPrinted
    let encodedData = try encoder.encode(model)
    return encodedData
}
func decode<T>(of jsonString: String, type: T.Type) throws -> T where T: Codable {
    let data = jsonString.data(using: .utf8)!
    let decoder = JSONDecoder()
    let model = try decoder.decode(T.self, from: data)
    return model
}

