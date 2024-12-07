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
        tableViewVideos.register(cell: VideoCell.self)
        tableViewVideos.separatorColor = .clear
        tableViewVideos.delegate = self
        tableViewVideos.dataSource = self
    }


    

}

extension VideosViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.videoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let video = videoList[indexPath.row]
        let cell = tableView.dequeueReusableCell(for: VideoCell.self, for: indexPath)
        cell.didTapDotsButton = {[weak self] in
            self?.configBottomSheet()
        }
        cell.configCell(model: video)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 95.0
    }
    func configBottomSheet (){
        let vc = BottomSheetViewController()
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: false)
    }
    
    
}
    



extension VideosViewController: VideosViewProtocol{
    func getVideos(videoList: [VideoModel.Item]) {
        self.videoList = videoList
        
//        DispatchQueue.main.async {
        tableViewVideos.reloadData()
//        }
        
        
    }
    
}


