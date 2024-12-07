//
//  BaseViewController.swift
//  YoutubeClone
//
//  Created by Juan Arbelaez on 3/12/24.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    func configNavigationBar (){
        let stackOptions = UIStackView()
        stackOptions.axis = .horizontal
        stackOptions.distribution = .fillEqually
        stackOptions.spacing = 0.0
        stackOptions.backgroundColor = .clear
        stackOptions.translatesAutoresizingMaskIntoConstraints = false
        
        
        let share = buildButton(selector: #selector(shareButtonPressed), image: .castImage , inset: 30)
        let magnify = buildButton(selector: #selector(magnifyButtonPressed), image: .magnifyingImage , inset: 33)
        let dots = buildButton(selector: #selector(dotsButtonPressed), image: .dotsImage , inset: 33)
        
        stackOptions.addArrangedSubview(share)
        stackOptions.addArrangedSubview(magnify)
        stackOptions.addArrangedSubview(dots)
        
        stackOptions.widthAnchor.constraint(equalToConstant: 120).isActive = true
        let customItemView = UIBarButtonItem(customView: stackOptions)
        customItemView.tintColor = .clear
        navigationItem.rightBarButtonItem = customItemView
        navigationController?.navigationBar.backgroundColor = .backgroundColorYT
        
    }

//    funcion para crear botones
    
    private func buildButton(selector: Selector, image: UIImage, inset:CGFloat ) -> UIButton{
        let button = UIButton(type: .custom)
        button.addTarget(self, action: selector, for: .touchUpInside)
        button.setImage(image, for: .normal)
        button.tintColor = .whiteColor
        let extraPadding : CGFloat = 2.0
//        button.configuration?.contentInsets = NSDirectionalEdgeInsets(top: inset+extraPadding, leading: inset, bottom: inset+extraPadding, trailing: inset)
//        button.configuration?.imagePadding = inset
        button.imageEdgeInsets = UIEdgeInsets(top: inset+extraPadding, left: inset, bottom: inset+extraPadding, right: inset)
        
        return button
    }
    
    @objc func shareButtonPressed(){
        print("shareButtonPressed")
    }
    
    @objc func magnifyButtonPressed(){
        print("magnifyButtonPressed")
    }

    @objc func dotsButtonPressed(){
        print("dotsButtonPressed")
    }

        
}
