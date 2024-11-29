//
//  PlaylistsProvider.swift
//  YoutubeClone
//
//  Created by Juan Arbelaez on 28/11/24.
//

import Foundation

protocol PlaylistProviderProtocol {
    func getPlaylists(channelId: String) async throws -> PlaylistModel
}

class PlaylistsProvider: PlaylistProviderProtocol {
    
    func getPlaylists(channelId: String) async throws -> PlaylistModel {
        var queryParams : [String:String] = ["part":"snippet,contentDetails", "channelId":channelId]
        
        let requestModel = RequestModel(endpoint: .playlists, queryItems: queryParams)
        do{
            let model = try await ServiceLayer.callService(requestModel, PlaylistModel.self)
            return model
        }catch {
            print(error)
            throw error
        }
    }
    
    
}
