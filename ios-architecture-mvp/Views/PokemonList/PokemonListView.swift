//
//  PokemonListView.swift
//  ios-architecture-mvp
//
//  Created by AIR on 2023/04/23.
//

import UIKit

class PokemonListView: XibLoadView {
    public let cellIdentifier = "PokemonListTableViewCell"
    @IBOutlet weak var favoriteFilterButton: UIButton!
    @IBOutlet weak var typeFilterButton: UIButton!
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(UINib(nibName: cellIdentifier, bundle: Bundle(for: type(of: self))), forCellReuseIdentifier: cellIdentifier)
            tableView.rowHeight = 60
        }
    }
}
