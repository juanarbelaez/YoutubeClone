//
//  PlaylistCell.swift
//  YoutubeClone
//
//  Created by Juan Arbelaez on 14/11/24.
//

import UIKit
import Kingfisher

class PlaylistCell: UITableViewCell {
    
    

    @IBOutlet weak var videoTitle: UILabel!
    @IBOutlet weak var videoImage: UIImageView!
    @IBOutlet weak var videoCount: UILabel!
    @IBOutlet weak var dotsImage: UIImageView!
    @IBOutlet weak var videoCountOverlay: UILabel!
    
    var didTapDotsButton: (()->Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        dotsImage.image = UIImage(named: "dots")?.withRenderingMode(.alwaysTemplate)
        dotsImage.tintColor = UIColor(named: "whiteColor")
    }
    
    
    @IBAction func dotsButtonTapped(_ sender: Any) {
        
        if let tap = didTapDotsButton{
            tap()
        }
    }
    
    func configCell(model: PlaylistModel.Item){
        selectionStyle = .none
        let imageUrl = model.snippet.thumbnails.medium.url
        if let url = URL(string: imageUrl){
            videoImage.kf.setImage(with: url)
        }
        videoTitle.text = model.snippet.title
        videoCount.text = "\(model.contentDetails.itemCount) videos"
        videoCountOverlay.text = String(model.contentDetails.itemCount)
        
    }
}
