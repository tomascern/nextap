//
//  Author.swift
//  nextap
//
//  Created by Tomáš Černý on 14/09/2020.
//  Copyright © 2020 Tomáš Černý. All rights reserved.
//

import Foundation

struct User: Decodable {
    let displayName: String
    let avatarImageUrl: String
    
    enum CodingKeys: String, CodingKey{
        case displayName = "display_name"
        case avatarImageUrl = "avatar_image_url"
    }
}
