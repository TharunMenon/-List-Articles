//
//  ArticleListTableViewController.swift
//  SICPA
//
//  Created by Tharun Menon on 05/04/2019.
//  Copyright © 2019 Tharun Menon. All rights reserved.
//

import Foundation
import UIKit

class ArticleListTableViewController: UITableViewController {
    
    var selectType: Int?
    var apiUrl:URL?
    var filterValue:String = " "
    
    private var articleListVM: ArticleListViewModel!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        tableView.tableFooterView = UIView()
        setup()
    }
    
    
private func setup() {
    
    if selectType == 0
    {
    apiUrl = URL(string:"https://api.nytimes.com/svc/mostpopular/v2/emailed/7.json?api-key=la65gzNUxJpAtGhWGoMEUHAfL1OWqiYG")!}
   else if selectType == 1
    {
    apiUrl = URL(string:"https://api.nytimes.com/svc/mostpopular/v2/shared/1/facebook.json?api-key=la65gzNUxJpAtGhWGoMEUHAfL1OWqiYG")!}
    else if selectType == 2
    {
    apiUrl = URL(string:"https://api.nytimes.com/svc/mostpopular/v2/viewed/1.json?api-key=la65gzNUxJpAtGhWGoMEUHAfL1OWqiYG")!}
   
    
    Webservice().getArticles(url: apiUrl!) { articles in
            
            if let articles = articles {
                
                self.articleListVM = ArticleListViewModel(articles: articles)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }}}}
    
    // MARK: - TableView Delegates & Data Source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.articleListVM == nil ? 0 : self.articleListVM.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListVM.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "articleCell", for: indexPath) as? ArticleCell else {
            fatalError("ArticleTableViewCell not found")
        }
        
        let articleVM = self.articleListVM.articleAtIndex(indexPath.row)
       
        
        cell.articleTitleLabel.text = articleVM.title
        cell.dateLabel.text = articleVM.datePublished
        cell.authorLabel.text = articleVM.byline
        
        return cell
    }
    
}
