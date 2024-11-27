//
//  BottomSheetViewController.swift
//  YoutubeClone
//
//  Created by Juan Arbelaez on 22/11/24.
//

import UIKit

class BottomSheetViewController: UIViewController {

    @IBOutlet weak var optionContainer: UIView!
    @IBOutlet weak var overlayView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapOverlay(_:)))
        overlayView.addGestureRecognizer(tapGesture)
    }

    
    @objc func didTapOverlay(_ sender: UITapGestureRecognizer){
        dismiss(animated: false)
    }


}
