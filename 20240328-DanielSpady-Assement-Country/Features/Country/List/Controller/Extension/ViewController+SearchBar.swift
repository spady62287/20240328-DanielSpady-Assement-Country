//
//  ViewController+SearchBar.swift
//  20240328-DanielSpady-Assement-Country
//
//  Created by Daniel Spady on 2024-03-28.
//

import UIKit

extension ViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        refreshSearchData(searchString: searchText)
    }
    
    private func filterListBySearch(searchString: String?) -> [CountryViewModel] {
        guard let searchStr = searchString else { return viewModelList ?? [] }

        if let viewModelList = viewModelList {
            return viewModelList.filter({
                let splitSearch = searchStr.components(separatedBy: CharacterSet.whitespacesAndNewlines)
                for searchPortion in splitSearch {
                    if !searchPortion.isEmpty && $0.name?.lowercased().range(of: searchPortion.lowercased()) == nil {
                        return false
                    }
                }
                return true
            })
        }
        return []
    }
    
    func refreshSearchData(searchString: String?) {
        filteredCountryList = filterListBySearch(searchString: searchString)
        tableView.reloadData()
    }
}
