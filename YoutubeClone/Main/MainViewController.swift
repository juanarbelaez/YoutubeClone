//
//  MainViewController.swift
//  YoutubeClone
//
//  Created by Juan Arbelaez on 25/10/24.
//

import UIKit

class MainViewController: BaseViewController  {
    
    
    
    @IBOutlet weak var tabsView: TabsView!
    var rootPageViewController: RootPageViewController!
    private var options : [String] = ["HOME", "VIDEOS", "PLAYLIST", "CHANNEL", "ABOUT"]
    var currentPageIndex: Int = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigationBar()
        tabsView.buildView(delegate: self, options: options)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? RootPageViewController{
            destination.delegateRoot = self
            rootPageViewController = destination
        }
    }
}

extension MainViewController: RootPageProtocol{
    func currentPage(_ index: Int) {
        print ("currentPage: ", index)
        currentPageIndex = index
        tabsView.selectedItem = IndexPath(item: index, section: 0)
        
        
    }
    
    
}

extension MainViewController: TabsViewProtocol{
    func didSelectOption(index: Int) {
        print("index:", index)
        
        let currentCell = tabsView.collectionView.cellForItem(at: IndexPath(item: index, section: 0))!
        tabsView.updateUnderline(xOrigin: currentCell.frame.origin.x, width: currentCell.frame.width)
        
        
        var direction: UIPageViewController.NavigationDirection = .forward
        if index < currentPageIndex {
            direction = .reverse
        }
        rootPageViewController.setViewControllerFromIndex(index: index, direction: direction)
        
        currentPageIndex = index
    }
}

