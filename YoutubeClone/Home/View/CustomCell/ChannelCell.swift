//
//  ChannelCell.swift
//  YoutubeClone
//
//  Created by Juan Arbelaez on 14/11/24.
//

import UIKit
import Kingfisher

class ChannelCell: UITableViewCell {

    @IBOutlet weak var bannerImage: UIImageView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var channelTitle: UILabel!
    @IBOutlet weak var subscribeLabel: UILabel!
    @IBOutlet weak var subscribersNumbersLabel: UILabel!
    @IBOutlet weak var bellImage: UIImageView!
    @IBOutlet weak var ChannelInfoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configView()
    }
    
    func configView() {
        selectionStyle = .none
        bellImage.image = .bellImage
        bellImage.tintColor = .grayColor
        profileImage.layer.cornerRadius = 51/2
    }
    
    func configCell(model: ChannelModel.Items){
        ChannelInfoLabel.text = model.snippet.description
        channelTitle.text = model.snippet.title
        subscribersNumbersLabel.text = "\(model.statistics?.subscriberCount ?? "0") suscribers • \(model.statistics?.videoCount ?? "0") videos "

        
//        No funciona porque el JSON no trae la INFO de las imagenes
//        if let bannerUrl = model.brandingSettings?.image.bannerExternalUrl, let url = URL(string: bannerUrl){
//            bannerImage.kf.setImage(with: url)
//        }
//
//        let imageUrl = model.snippet.thumbnails.medium.url
//        guard let url = URL(string: imageUrl) else{
//            return
//        }
//        profileImage.kf.setImage(with: url)
    }
}
