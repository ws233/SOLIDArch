//
//  SimpleArchTableViewController.swift
//  SOLID
//
//  Created by Cyril Makankov on 18/05/2019.
//  Copyright © 2019 ws233. All rights reserved.
//

import UIKit
import SOLIDArch

class SimpleArchTableViewController: UITableViewController {

    private let viewModels = [
        TextViewModel(text: "First Cell"),
        TextViewModel(text: "Cell #2"),
        TextViewModel(text: "This is also a text cell"),
        ValueSettingViewModel(parameter: "Size", value: 25),
        ValueSettingViewModel(parameter: "Opacity", value: 37),
        ValueSettingViewModel(parameter: "Blur", value: 13),
        SwitchedSettingViewModel(parameter: "Push notifications enabled", enabled: true),
        SwitchedSettingViewModel(parameter: "Camera access enabled", enabled: false),
    ]
    
    private lazy var dataSource: TableViewDataSource = {
        let dataProvider = ArrayDataProvider(array: viewModels)
        let dataSource = TableViewDataSource(dataProvider: dataProvider)
        dataSource.registerCell(class: TextTableViewCell.self,
                                identifier: "TextTableViewCell",
                                for: TextViewModel.self)
        dataSource.registerCell(class: DetailedTextTableViewCell.self,
                                identifier: "DetailedTextTableViewCell",
                                for: ValueSettingViewModel.self)
        dataSource.registerCell(class: DetailedTextTableViewCell.self,
                                identifier: "SwitchedSettingTableViewCell",
                                for: SwitchedSettingViewModel.self)
        return dataSource
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = dataSource
    }
}
