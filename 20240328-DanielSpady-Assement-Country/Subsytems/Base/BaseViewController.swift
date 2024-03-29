//
//  BaseViewController.swift
//  20240328-DanielSpady-Assement-Country
//
//  Created by Daniel Spady on 2024-03-28.
//

import UIKit

class BaseViewController: UIViewController {
    
    // View Models
    var viewModelList: [CountryViewModel]?
    var filteredCountryList: [CountryViewModel] = []

    // Loading Screen
    lazy var loadingSpinner: AnimatedLoader = AnimatedLoader()

    // Lazy Loading View
    lazy var loadingView: UIView = { [unowned self] in
        let view = UIView(frame: self.view.bounds)
        view.backgroundColor = UIColor.black
        view.alpha = 0
        
        view.addSubview(self.loadingSpinner)
        self.loadingSpinner.backgroundColor = UIColor.clear
        self.loadingSpinner.translatesAutoresizingMaskIntoConstraints = false
        self.loadingSpinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        self.loadingSpinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        self.loadingSpinner.widthAnchor.constraint(equalToConstant: 60).isActive = true
        self.loadingSpinner.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        self.view.addSubview(view)
        return view
    }()
    
    // Load Data
    func loadData(for tableView: UITableView, errorView: UIView) {
        
        hideErrorView(with: errorView)
        showLoadingView(animated: true, after: 3.0)

        let request = CountryListRequest()
        CountryListService.countryListJSONObject(request) { response in
            DispatchQueue.main.async { [weak self] in
                if let error = response.error {
                    self?.handleRequestCompleted(model: [], tableView: tableView)
                    self?.showErrorView(with: errorView)
                    dump(error)
                } else if response.result == nil {
                    self?.handleRequestCompleted(model: [], tableView: tableView)
                    self?.hideLoadingView()
                    self?.showErrorView(with: errorView)
                } else if let result = response.result {
                    self?.handleRequestCompleted(model: result, tableView: tableView)
                    self?.hideLoadingView()
                }
            }
        }
    }
    
    // Handle Country List
    
    func handleRequestCompleted(model: [CountryDataModel], tableView: UITableView) {
        self.viewModelList = model.map { CountryViewModel(model: $0) }
        self.filteredCountryList = model.map { CountryViewModel(model: $0) }
        tableView.reloadData()
    }
    
    // Base View Methods

    func showErrorView(animated: Bool = true, after delay: TimeInterval? = nil, with errorView: UIView) {
        UIView.animate(withDuration: animated ? 0.3 : 0.0, delay: delay ?? 0, options: [], animations: {
            errorView.isHidden = false
        })
    }
    
    func hideErrorView(with errorView: UIView) {
        UIView.animate(withDuration: 0.3, animations: {
            errorView.isHidden = true
        })
    }
        
    func showLoadingView(animated: Bool = true, after delay: TimeInterval? = nil) {
        view.bringSubviewToFront(loadingView)
        loadingSpinner.start()
        UIView.animate(withDuration: animated ? 0.3 : 0.0, delay: delay ?? 0, options: [], animations: {
            self.loadingView.alpha = 1
        })
    }
    
    func hideLoadingView() {
        self.loadingSpinner.stop()
        UIView.animate(withDuration: 0.3, animations: {
            self.loadingView.alpha = 0
        })
    }
}
