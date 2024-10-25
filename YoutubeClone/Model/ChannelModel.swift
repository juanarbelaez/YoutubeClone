//
//  ChannelModel.swift
//  YoutubeClone
//
//  Created by Juan Arbelaez on 25/10/24.
//
import Foundation

// MARK: - ChannelModel
struct ChannelModel: Decodable {
    let kind, etag: String
    let pageInfo: PageInfo
    
    
    // MARK: - PageInfo
    struct PageInfo: Codable {
        let totalResults, resultsPerPage: Int
    }

}
