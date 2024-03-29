//
//  ViewController.swift
//  20240328-DanielSpady-Assement-Country
//
//  Created by Daniel Spady on 2024-03-28.
//

import UIKit

class ViewController: BaseViewController {
    
    @IBOutlet weak var errorView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    private var searchString: String?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        
        self.loadData(for: tableView, errorView: errorView)
    }
}

