//
//  PlaylistsViewController.swift
//  YoutubeClone
//
//  Created by Juan Arbelaez on 25/10/24.
//

import UIKit

class PlaylistsViewController: UIViewController {
   
    

    
    @IBOutlet weak var tableViewPlaylists: UITableView!
    lazy var presenter = PlaylistsPresenter(delegate: self)
    var playlistList : [PlaylistModel.Item] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configTableView()
        
        Task{
            await presenter.getPlaylists()
        }

    }
    
    
    func configTableView(){
        let nibPlaylists = UINib(nibName: "\(PlaylistCell.self)", bundle: nil)
        tableViewPlaylists.register(nibPlaylists, forCellReuseIdentifier: "\(PlaylistCell.self)")
        
        tableViewPlaylists.separatorColor = .clear
        tableViewPlaylists.delegate = self
        tableViewPlaylists.dataSource = self
        
    }
    
    
    

}

extension PlaylistsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playlistList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let playlist = playlistList[indexPath.row]
        guard let cell = tableViewPlaylists.dequeueReusableCell(withIdentifier: "\(PlaylistCell.self)", for: indexPath) as? PlaylistCell else{
            return UITableViewCell()
        }
        cell.didTapDotsButton = {[weak self] in
            self?.configBottomSheet()
        }
        cell.configCell(model: playlist)
        return cell
    }
    
    func configBottomSheet (){
        let vc = BottomSheetViewController()
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: false)
    }
    
}

extension PlaylistsViewController: PlaylistsViewProtocol{
    
    func getPlaylists(playlistList: [PlaylistModel.Item]) {
        self.playlistList = playlistList
        tableViewPlaylists.reloadData()
    }
}

