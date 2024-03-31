//
//  TableViewController+SearchResultsUpdating.swift
//  20240328-DanielSpady-Assement-Country
//
//  Created by Daniel Spady on 2024-03-31.
//

import UIKit

extension TableViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        refreshSearchData(searchString: searchController.searchBar.text)
    }
    
    private func filterCountryNameBySearch(searchString: String?) -> [CountryViewModel] {
        guard let searchStr = searchString else { return viewModelList ?? [] }

        if let viewModelList = viewModelList {
            return viewModelList.filter({
                let splitSearch = searchStr.components(separatedBy: CharacterSet.whitespacesAndNewlines)
                for searchPortion in splitSearch {
                    if !searchPortion.isEmpty, $0.name?.lowercased().range(of: searchPortion.lowercased()) == nil {
                        return false
                    }
                }
                return true
            })
        }
        return []
    }
    
    private func filterCountryCapitalBySearch(searchString: String?) -> [CountryViewModel] {
        guard let searchStr = searchString else { return viewModelList ?? [] }

        if let viewModelList = viewModelList {
            return viewModelList.filter({
                let splitSearch = searchStr.components(separatedBy: CharacterSet.whitespacesAndNewlines)
                for searchPortion in splitSearch {
                    if !searchPortion.isEmpty, $0.capital?.lowercased().range(of: searchPortion.lowercased()) == nil {
                        return false
                    }
                }
                return true
            })
        }
        return []
    }
    
    func refreshSearchData(searchString: String?) {
        filteredCountryList = filterCountryNameBySearch(searchString: searchString) + filterCountryCapitalBySearch(searchString: searchString)
        tableView.reloadData()
    }
}
