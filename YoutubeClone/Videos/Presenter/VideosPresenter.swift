//
//  VideosPresenter.swift
//  YoutubeClone
//
//  Created by Juan Arbelaez on 26/11/24.
//

import Foundation

protocol VideosViewProtocol : AnyObject{
    func getVideos(videoList : [VideoModel.Item])
}


class VideosPresenter{
    
    private weak var delegate : VideosViewProtocol?
    private var provider : VideoProviderProtocol
    
    init(delegate: VideosViewProtocol, provider: VideoProviderProtocol = VideosProvider()){
        
        self.delegate = delegate
        self.provider = provider
        
    }
    
    func getVideos() async{
        do{
            let videos = try await provider.getVideos(channelId: Constants.channelId).items
            delegate?.getVideos(videoList: videos)
        }catch{
            debugPrint(error.localizedDescription)
        }
    }
}

