//
//  OptionCell.swift
//  YoutubeClone
//
//  Created by Juan Arbelaez on 5/12/24.
//

import UIKit

class OptionCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configCell(option: String){
        titleLabel.text = option
    }

}
