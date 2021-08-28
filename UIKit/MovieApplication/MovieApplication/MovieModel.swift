//
//  MovieModel.swift
//  MovieApplication
//
//  Created by Kim TaeSoo on 2021/08/24.
//

import Foundation

// api모델을 잡는법

struct MovieModel: Codable {
    let resultCount: Int
    // key에 해당하는 것들의 배열
    let results: [MovieResult]
}

struct MovieResult: Codable {
    // key에 해당함, json 파일의 key값과 일치해야함
    let trackName: String?
    let previewUrl: String?
    let artworkUrl100: String?
    let shortDescription: String?
    let longDescription: String?
    let trackPrice: Double?
    let currency: String?
    let releaseDate: String?
    /* 변수명을 다른걸 사용하고 싶을때는 enum을 사용
    enum CodingKeys: String, CodingKey {
        case image = "artworkUrl100"
        case title = "trackName"
        case poster = "previewUrl"
    }
 */
}
