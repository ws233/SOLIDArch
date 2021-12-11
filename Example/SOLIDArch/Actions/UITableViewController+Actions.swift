//
//  UITableViewController+Actions.swift
//  SOLIDArch_Example
//
//  Created by Cyril Makankov on 11.07.2022.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import UIKit

extension UITableViewController {
    
    @IBAction func showActionSheet(sender: AnyObject) {
        guard let cell = sender as? DetailedTextTableViewCell else { return }
        
        let alert = UIAlertController(
            title: "Нажата ячейка",
            message: cell.viewModel?.text,
            preferredStyle: .actionSheet
        )
        alert.addAction(.init(title: "Ok", style: .default, handler: nil))

        present(alert, animated: true, completion: nil)
    }
}
