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
        
        var queryParams : [String:String] = ["part":"snippet", "type":"video", "maxResaults":"50"]
        if !channelId.isEmpty{
            queryParams["channelId"] = channelId
        }
        let requestModel = RequestModel(endpoint: .search, queryItems: queryParams)
        
        do{
            let model = try await ServiceLayer.callService(requestModel, VideoModel.self)
            return model
        }catch {
            print(error)
            throw error
        }
    }
    
    
}
