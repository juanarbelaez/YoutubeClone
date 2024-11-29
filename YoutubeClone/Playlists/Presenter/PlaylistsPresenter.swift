//
//  PlaylistsPresenter.swift
//  YoutubeClone
//
//  Created by Juan Arbelaez on 28/11/24.
//

import Foundation

protocol PlaylistsViewProtocol: AnyObject{
    func getPlaylists(playlistList: [PlaylistModel.Item])
}


class PlaylistsPresenter{
    
    weak var delegate : PlaylistsViewProtocol?
    var provider : PlaylistProviderProtocol
    
    init(delegate: PlaylistsViewProtocol?, provider: PlaylistProviderProtocol = PlaylistsProvider()) {
        self.delegate = delegate
        self.provider = provider
    }
    
    
    @MainActor
    func getPlaylists() async {
        do{
            let playlists = try await provider.getPlaylists(channelId: Constants.channelId).items
            delegate?.getPlaylists(playlistList: playlists)
        }catch{
            debugPrint(error.localizedDescription)
        }
    }
}
