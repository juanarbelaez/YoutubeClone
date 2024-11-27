//
//  VideoCell.swift
//  YoutubeClone
//
//  Created by Juan Arbelaez on 14/11/24.
//

import UIKit

class VideoCell: UITableViewCell {

    @IBOutlet weak var videoImage: UIImageView!
    @IBOutlet weak var videoName: UILabel!
    @IBOutlet weak var channelName: UILabel!
    @IBOutlet weak var dotsImage: UIImageView!
    @IBOutlet weak var viewsCountLabel: UILabel!
    
    var didTapDotsButton: (()->Void)?
    override func awakeFromNib() {
        super.awakeFromNib()
        configView()
    }
    
    private func configView(){
        
    }
    
    @IBAction func dotsButtonTapped(_ sender: Any) {
        if let tap = didTapDotsButton{
            tap()
        }
        
    
    }
    func configCell(model: Any){
        selectionStyle = .none
        dotsImage.image = UIImage(named: "dots")?.withRenderingMode(.alwaysTemplate)
        dotsImage.tintColor = UIColor(named: "whiteColor")
        
        if let video = model as? VideoModel.Item {
            if let imageUrl = video.snippet?.thumbnails.medium?.url, let url = URL(string: imageUrl){
                videoImage.kf.setImage(with: url)
            }
            videoName.text = video.snippet?.title ?? ""
            channelName.text = video.snippet?.channelTitle ?? ""
            viewsCountLabel.text = "\(video.statistics?.viewCount ?? "0") views • 3 months ago "
           
            
            
            
        } else if let playlistItems = model as? PlaylistItemModel.Item {
            
            if let imageUrl = playlistItems.snippet.thumbnails.medium?.url, let url = URL(string: imageUrl){
                videoImage.kf.setImage(with: url)
            }
            videoName.text = playlistItems.snippet.title
            channelName.text = playlistItems.snippet.channelTitle
            viewsCountLabel.text = "332 views • 3 months ago "
        }
    }
    
}
