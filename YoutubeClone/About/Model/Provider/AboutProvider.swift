//
//  AboutProvider.swift
//  YoutubeClone
//
//  Created by Juan Arbelaez on 2/12/24.
//

import Foundation


protocol AboutProviderProtocol{
    func getChannel(channelId: String) async throws -> ChannelModel
    
}

class AboutProvider: AboutProviderProtocol{
    func getChannel(channelId: String) async throws -> ChannelModel {
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
    
    
}
