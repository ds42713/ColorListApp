// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let aPIColor = try? newJSONDecoder().decode(APIColor.self, from: jsonData)

import Foundation

// MARK: - APIColor
struct APIColor: Codable {
    let page, perPage, total, totalPages: Int
    let data: [Datum]
    let ad: Ad

    enum CodingKeys: String, CodingKey {
        case page
        case perPage = "per_page"
        case total
        case totalPages = "total_pages"
        case data, ad
    }
}

// MARK: - Ad
struct Ad: Codable {
    let company: String
    let url: String
    let text: String
}

// MARK: - Datum
struct Datum: Codable {
    let id: Int
    let name: String
    let year: Int
    let color, pantoneValue: String

    enum CodingKeys: String, CodingKey {
        case id, name, year, color
        case pantoneValue = "pantone_value"
    }
}
