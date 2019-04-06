//
//  SearchViewModel.swift
//  SICPA
//
//  Created by Tharun Menon on 05/04/2019.
//  Copyright © 2019 Tharun Menon. All rights reserved.
//

import Foundation

struct SearchListViewModel {
    
    private var searchViewModels = [SearchViewModel]()
    
    mutating func addsearchViewModel(_ vm: SearchViewModel) {
        self.searchViewModels.append(vm)
    }
    
    func numberOfRows(_ section: Int) -> Int {
        
        return self.searchViewModels.count
    }
    
    func modelAt(_ index: Int) -> SearchViewModel {
        
         
        return self.searchViewModels[index]
    }
    
}

struct SearchViewModel: Codable {
    let response: searchListViewModel
}

struct searchListViewModel: Codable {

    let docs: [searchListViewModelValues]
}

struct searchListViewModelValues: Codable {

    let snippet: String
    let lead_paragraph: String

}




