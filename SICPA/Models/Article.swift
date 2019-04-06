//
//  Article.swift
//  SICPA
//
//  Created by Tharun Menon on 05/04/2019.
//  Copyright © 2019 Tharun Menon. All rights reserved.
//

import Foundation

struct ArticleList: Codable {
    let results: [Article]
}

struct Article: Codable {
    let title: String
    let published_date: String
    let byline:String
}




