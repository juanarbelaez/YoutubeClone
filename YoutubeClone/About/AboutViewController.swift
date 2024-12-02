//
//  AboutViewController.swift
//  YoutubeClone
//
//  Created by Juan Arbelaez on 25/10/24.
//

import UIKit

class AboutViewController: UIViewController {

    @IBOutlet weak var tableViewAbout: UITableView!
    lazy var presenter = AboutPresenter(delegate: self)
    var channelList : [ChannelModel.Items] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configTableView()
        Task{
            await presenter.getChannel()
        }
    }

         
    func configTableView (){
        let nibAbout = UINib(nibName: "\(AboutCell.self)", bundle: nil)
        tableViewAbout.register(nibAbout, forCellReuseIdentifier: "\(AboutCell.self)")
        
        tableViewAbout.separatorColor = .clear
        tableViewAbout.backgroundColor = .clear
    
        tableViewAbout.delegate = self
        tableViewAbout.dataSource = self
        
    }
}

extension AboutViewController: AboutViewProtocol{
    func getChannel(channelList: [ChannelModel.Items]) {
        self.channelList = channelList
        tableViewAbout.reloadData()
        
    }
    
}

extension AboutViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let channel = channelList[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(AboutCell.self)", for: indexPath) as? AboutCell else{
            return UITableViewCell()
        }
        cell.configCell(model: channel)
        return cell
    }
    
    
}


