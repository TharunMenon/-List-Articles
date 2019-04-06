//
//  HomeTableViewController.swift
//  SICPA
//
//  Created by Tharun Menon on 05/04/2019.
//  Copyright © 2019 Tharun Menon. All rights reserved.
//

import Foundation
import UIKit

class HomeTableViewController: UITableViewController {
    
    let section = ["Search", "Popular"]
    let sectionitems = [["Search Articles"], ["Most Viewed", "Most Shared","Most Emailed"]]
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        tableView.tableFooterView = UIView()
    }
    
    // MARK: - TableView Delegates & Data Source
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.section[section]
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.section.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.sectionitems[section].count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "homeCell", for: indexPath) as? HomeCell else {
            fatalError("settingCell not found")
        }
        cell.titleLabel?.text = sectionitems[indexPath.section][indexPath.row]
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let sectionIndexPath = indexPath.section
        let  rowIndexPath = indexPath.row
        if sectionIndexPath == 0
        {
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "SerachViewController") as? SerachViewController
            self.navigationController?.pushViewController(vc!, animated: true)
        }
        else if sectionIndexPath == 1
        {
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ArticleListTableViewController") as? ArticleListTableViewController
           if rowIndexPath == 0
            {
                vc?.selectType = 0
            }
            if rowIndexPath == 1
            {
                vc?.selectType = 01
            }
            if rowIndexPath == 2
            {
                vc?.selectType = 2
            }
             self.navigationController?.pushViewController(vc!, animated: true)
        }
    }
        
        
        
    }

