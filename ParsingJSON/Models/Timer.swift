//
//  File.swift
//  ParsingJSON
//
//  Created by Vasiliy on 10.08.2022.
//

struct Timer: Decodable {
    let product: String
    let `init`: String
    let dataseries: [DataSeries]
}

struct DataSeries: Decodable {
    let timepoint: Int
    let cloudcover: Int
    let seeing: Int
}
