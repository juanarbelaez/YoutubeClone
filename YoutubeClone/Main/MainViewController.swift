//
//  MainViewController.swift
//  YoutubeClone
//
//  Created by Juan Arbelaez on 25/10/24.
//

import UIKit

class MainViewController: UIViewController {
    var rootPageViewController: RootPageViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? RootPageViewController{
            rootPageViewController = destination
        }
    }
    


}
