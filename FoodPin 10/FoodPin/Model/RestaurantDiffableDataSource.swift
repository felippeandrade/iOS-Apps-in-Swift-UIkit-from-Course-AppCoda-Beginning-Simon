//
//  RestaurantDiffableDataSource.swift
//  RestaurantDiffableDataSource
//
//  Created by Simon Ng on 16/8/2021.
//

import UIKit

enum Section {
    case all
}

class RestaurantDiffableDataSource: UITableViewDiffableDataSource<Section, Restaurant> {

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
}
