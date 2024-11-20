//
//  HomeProviderMock.swift
//  YoutubeClone
//
//  Created by Juan Arbelaez on 13/11/24.
//

import Foundation


class HomeProviderMock: HomeProviderProtocol{
    func getVideos(searchString: String, channelId: String) async throws -> VideoModel {
        guard let model = Utils.parseJson(jsonName: "SearchVideos", model: VideoModel.self) else{
            print("Error Videos")
            throw NetworkError.jsonDecoder
        }
        return model
    }
    
    func getChannel(channelId: String) async throws -> ChannelModel {
        guard let model = Utils.parseJson(jsonName: "Channel", model: ChannelModel.self) else{
            print("Error Channel")
            throw NetworkError.jsonDecoder
        }
        return model
    }
    
    func getPlaylists(channelId: String) async throws -> PlaylistModel {
        guard let model = Utils.parseJson(jsonName: "Playlist", model: PlaylistModel.self) else {
            print("Error Playlist")
            throw NetworkError.jsonDecoder
        }
        return model
    }
    
    func getPlaylistItem(playlistId: String) async throws -> PlaylistItemModel {
        guard let model = Utils.parseJson(jsonName: "PlaylistItems", model: PlaylistItemModel.self) else{
            print("Error PlaylistItem")
            throw NetworkError.jsonDecoder
        }
        return model
    }
    
    
}
