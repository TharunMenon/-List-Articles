//
//  SearchListTableViewController.swift
//  SICPA
//
//  Created by Tharun Menon on 05/04/2019.
//  Copyright © 2019 Tharun Menon. All rights reserved.
//

import Foundation
import UIKit

class SearchListTableViewController: UITableViewController {


    var filterValue:String = " "
    var titleArray = [String]()
    var descArray = [String]()
    var activityIndicatorView: UIActivityIndicatorView!
    
    private var searchListViewModel = SearchListViewModel()

   

    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        
        activityIndicatorView = UIActivityIndicatorView(style: .gray)
        
        tableView.backgroundView = activityIndicatorView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        tableView.tableFooterView = UIView()
        setup()

}
    private func setup() {

          activityIndicatorView.startAnimating()
          let apiUrl = URL(string:"https://api.nytimes.com/svc/search/v2/articlesearch.json?q=\(filterValue)&api-key=la65gzNUxJpAtGhWGoMEUHAfL1OWqiYG")!
        
        let weatherResource = Resource<SearchViewModel>(url: apiUrl) { data in
            
            let weatherVM = try? JSONDecoder().decode(SearchViewModel.self, from: data)
            return weatherVM
        }
        
        Webservice().load(resource: weatherResource) { [weak self] result in
            
            if let searchVM = result {

                self!.searchListViewModel.addsearchViewModel(searchVM)
                self!.tableView.reloadData()
                self!.activityIndicatorView.stopAnimating()
            }
            }}

    // MARK: - TableView Delegates & Data Source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
       
        return self.searchListViewModel.numberOfRows(section)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath) as? SearchCell else {
            fatalError("ArticleTableViewCell not found")
        }

       let weatherVM = self.searchListViewModel.modelAt(indexPath.row)
       let values = weatherVM.response.docs
        
        for value in values {
            titleArray.append(value.lead_paragraph)
            descArray.append(value.snippet)
        }
        cell.titleLabel.text = titleArray[indexPath.row]
        cell.descriptionLabel.text = descArray[indexPath.row]
        return cell
    }

}

