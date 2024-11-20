//
//  ChannelCell.swift
//  YoutubeClone
//
//  Created by Juan Arbelaez on 14/11/24.
//

import UIKit

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
        bellImage.image = UIImage(named: "bell")?.withRenderingMode(.alwaysTemplate)
        bellImage.tintColor = UIColor(named: "graycColor")
        profileImage.layer.cornerRadius = 51/2
    }
    
    func configCell(model: ChannelModel.Items){
        ChannelInfoLabel.text = model.snippet.description
        channelTitle.text = model.snippet.title
        subscribersNumbersLabel.text = "\(model.statistics?.subscriberCount ?? "0") suscribers - \(model.statistics?.videoCount ?? "0") videos "
        
    }
}
