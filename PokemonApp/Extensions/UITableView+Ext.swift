//
//  UITableView+Ext.swift
//  PokemonApp
//
//  Created by Erdal Keser on 22.03.2023.
//

import UIKit
extension UITableView {
    
    func reloadOnMainThread(){
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
}
