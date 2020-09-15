//
//  Story.swift
//  nextap
//
//  Created by Tomáš Černý on 14/09/2020.
//  Copyright © 2020 Tomáš Černý. All rights reserved.
//

import Foundation

struct Story: Decodable {
    let id: String
    let coverSrc: String
    let user: User
    
    enum CodingKeys: String, CodingKey {
        case id
        case coverSrc = "cover_src"
        case user
    }
}
