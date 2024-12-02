//
//  AboutCell.swift
//  YoutubeClone
//
//  Created by Juan Arbelaez on 2/12/24.
//

import UIKit

class AboutCell: UITableViewCell {

    @IBOutlet weak var DescriptionInfoLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configView()
    }

    func configView(){
        selectionStyle = .none
    }
    
    func configCell(model: ChannelModel.Items){
//        print(model.snippet.title )
        DescriptionInfoLabel.text = model.snippet.description
    }
}
