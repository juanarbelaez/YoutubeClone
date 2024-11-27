//
//  VideosViewController.swift
//  YoutubeClone
//
//  Created by Juan Arbelaez on 25/10/24.
//

import UIKit

class VideosViewController: UIViewController {
    

    @IBOutlet weak var tableViewVideos: UITableView!
    lazy var presenter = VideosPresenter(delegate: self)
    var videoList : [VideoModel.Item] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configTableView()
        Task{
            await presenter.getVideos()
        }
    }
    
    func configTableView(){
        
        let nibVideos = UINib(nibName: "\(VideoCell.self)", bundle: nil)
        tableViewVideos.register(nibVideos, forCellReuseIdentifier: "\(VideoCell.self)")
        
        tableViewVideos.separatorColor = .clear
    }


    

}

// Empezar en el 10:02 para la extension de los Delegates


extension VideosViewController: VideosViewProtocol{
    func getVideos(videoList: [VideoModel.Item]) {
        self.videoList = videoList
        tableViewVideos.reloadData()
    }
    
}

