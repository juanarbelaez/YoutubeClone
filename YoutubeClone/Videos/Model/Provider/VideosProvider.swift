//
//  VideosProvider.swift
//  YoutubeClone
//
//  Created by Juan Arbelaez on 26/11/24.
//

import Foundation

protocol VideoProviderProtocol{
    func getVideos(channelId: String) async throws -> VideoModel
}

class VideosProvider: VideoProviderProtocol {
    func getVideos(channelId: String) async throws -> VideoModel {
        
    }
    
    
}
