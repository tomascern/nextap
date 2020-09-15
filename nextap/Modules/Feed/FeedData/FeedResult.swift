//
//  FeedResult.swift
//  nextap
//
//  Created by Tomáš Černý on 14/09/2020.
//  Copyright © 2020 Tomáš Černý. All rights reserved.
//

import Foundation

struct FeedResult: Decodable {
    let data: [Story]
    
    enum CodingKeys: String, CodingKey {
        case data
    }
}
