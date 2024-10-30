//
//  HomeProvider.swift
//  YoutubeClone
//
//  Created by Juan Arbelaez on 25/10/24.
//

import Foundation

protocol HomeProviderProtocol{
    func getVideos(searchString: String, channelId: String) async throws -> VideoModel
    func getChannel(channelId: String) async throws -> ChannelModel
    func getPlaylists(channelId: String) async throws -> PlaylistModel
    func getPlaylistItem(playlistId: String) async throws -> PlaylistItemModel
}

class HomeProvider: HomeProviderProtocol{
    
    func getVideos(searchString: String, channelId: String) async throws -> VideoModel{
        var queryParams : [String:String] = ["part":"snippet", "type":"video"]
        if !channelId.isEmpty{
            queryParams["channelId"] = channelId
        }
        if !searchString.isEmpty{
            queryParams["q"] = searchString
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
    
    
    func getChannel(channelId: String) async throws -> ChannelModel{
        var queryParams : [String:String] = ["part":"snippet,statistics,brandingSettings", "id":channelId]
        
        let requestModel = RequestModel(endpoint: .channels, queryItems: queryParams)
        do{
            let model = try await ServiceLayer.callService(requestModel, ChannelModel.self)
            return model
        }catch {
            print(error)
            throw error
        }
        
    }
    
    func getPlaylists(channelId: String) async throws -> PlaylistModel{
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
    
    func getPlaylistItem(playlistId: String) async throws -> PlaylistItemModel{
        var queryParams : [String:String] = ["part":"snippet,id,contentDetails", "playlistId":playlistId]
        
        let requestModel = RequestModel(endpoint: .playlistItems, queryItems: queryParams)
        do{
            let model = try await ServiceLayer.callService(requestModel, PlaylistItemModel.self)
            return model
        }catch {
            print(error)
            throw error
        }
        
    }
}
