//
//  AboutPresenter.swift
//  YoutubeClone
//
//  Created by Juan Arbelaez on 2/12/24.
//

import Foundation

protocol AboutViewProtocol: AnyObject{
    func getChannel(channelList: [ChannelModel.Items])
    
}


class AboutPresenter{
    
    private weak var delegate : AboutViewProtocol?
    private var provider : AboutProviderProtocol
    
    init(delegate: AboutViewProtocol, provider: AboutProviderProtocol = AboutProvider()) {
        self.delegate = delegate
        self.provider = provider
    }
    
    @MainActor
    func getChannel() async {
        do{
            let channel = try await provider.getChannel(channelId: Constants.channelId).items
            delegate?.getChannel(channelList: channel)
        }catch{
            debugPrint(error.localizedDescription)
        }
    }
    
    
}
