//
//  FirstTableViewController.swift
//  SOLIDArch_Example
//
//  Created by Cyril Makankov on 18.01.2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import SOLIDArch

protocol FirstDataSourceFibricProtocol {
    func makePlainListDataSource() -> UITableViewDataSource?
    func makeSectionDevidedDataSource() -> UITableViewDataSource?
}

class FirstTableViewController: UITableViewController {
    
    let factory: FirstTableViewFactoryProtocol
    
    // MARK: - Lifecycle
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        factory = FirstDataSourceFactory()
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        factory = FirstDataSourceFactory()
        super.init(coder: aDecoder)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationTableViewController = segue.destination as? ConfigurableTableViewController
            else {
                return
        }
        switch segue.identifier {
        case "plainListDataSegue":
            destinationTableViewController.dataSource = factory.makePlainListDataSource()
        case "sectionDevidedDataSegue":
            destinationTableViewController.dataSource = factory.makeSectionDevidedDataSource()
        default:
            break
        }
    }
}
