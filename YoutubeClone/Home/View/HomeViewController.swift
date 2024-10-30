//
//  HomeViewController.swift
//  YoutubeClone
//
//  Created by Juan Arbelaez on 25/10/24.
//

import UIKit

class HomeViewController: UIViewController {

    lazy var presenter = HomePresenter(delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Task{
            await presenter.getHomeObjects()
        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension HomeViewController: HomeViewProtocol{
    func getData(list: [[Any]]) {
        print("list:", list)
    }
    
    
}
