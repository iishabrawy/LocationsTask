//
//  AboutModel.swift
//  Task App
//
//  Created by Ismael AlShabrawy on 02/12/2020.
//

import Foundation

// MARK: - AboutModel
class AboutModel: Codable {
    var message: String?
    var status: Bool?
    var innerData: [InnerDatum]?

    enum CodingKeys: String, CodingKey {
        case message = "Message"
        case status = "Status"
        case innerData = "InnerData"
    }

    init(message: String?, status: Bool?, innerData: [InnerDatum]?) {
        self.message = message
        self.status = status
        self.innerData = innerData
    }
    
    init() {
        self.message = nil
        self.status = nil
        self.innerData = nil
    }
}

// MARK: - InnerDatum
class InnerDatum: Codable {
    var id: Int?
    var content, createdAt, updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case content
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }

    init(id: Int?, content: String?, createdAt: String?, updatedAt: String?) {
        self.id = id
        self.content = content
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
