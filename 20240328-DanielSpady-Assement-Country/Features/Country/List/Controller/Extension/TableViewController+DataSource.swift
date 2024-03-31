//
//  TableViewController+DataSource.swift
//  20240328-DanielSpady-Assement-Country
//
//  Created by Daniel Spady on 2024-03-31.
//

import UIKit

extension TableViewController {
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as! CountryTableViewCell
        let viewModel = filteredCountryList[indexPath.row]
        cell.nameLabel.text = "\(viewModel.name ?? ""), \(viewModel.region ?? "")"
        cell.codeLabel.text = viewModel.code
        cell.capitalLabel.text = viewModel.capital
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredCountryList.count
    }
}
