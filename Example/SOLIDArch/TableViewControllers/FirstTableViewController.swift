//
//  FirstTableViewController.swift
//  SOLIDArch_Example
//
//  Created by Cyril Makankov on 18.01.2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import SOLIDArch

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
            destinationTableViewController.delegate = factory.makePlainListDelegate()
            destinationTableViewController.dataSource = factory.makePlainListDataSource()
        case "sectionDevidedDataSegue":
            destinationTableViewController.delegate = factory.makeSectionDevidedDelegate()
            destinationTableViewController.dataSource = factory.makeSectionDevidedDataSource()
        default:
            break
        }
    }
}
