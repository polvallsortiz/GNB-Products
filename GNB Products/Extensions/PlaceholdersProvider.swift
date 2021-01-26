//
//  PlaceholdersProvider.swift
//  GNB Products
//
//  Created by Pol Valls Ortiz on 25/1/21.
//

import Foundation
import HGPlaceholders

extension PlaceholdersProvider {
    static var gnb: PlaceholdersProvider {
        var commonStyle = PlaceholderStyle()
        commonStyle.backgroundColor = .white
        commonStyle.actionBackgroundColor = .white
        commonStyle.actionTitleColor = .white
        commonStyle.titleColor = .black
        commonStyle.isAnimated = true
        
        var retryStyle = commonStyle
        retryStyle.actionBackgroundColor = .systemBlue
        
        var loadingStyle = commonStyle
        loadingStyle.actionBackgroundColor = .clear
        loadingStyle.actionTitleColor = .clear
        
        var loadingData: PlaceholderData = .loading
        loadingData.image = UIImage(named: "Download")?.withTintColor(.darkGray)
        loadingData.title = "Getting the last data"
        loadingData.subtitle = "from the GNB Products system"
        let loading = Placeholder(data: loadingData, style: loadingStyle, key: .loadingKey)
        
        var errorData: PlaceholderData = .error
        errorData.image = UIImage(named: "Error")?.withTintColor(.darkGray)
        errorData.title = "Oops!"
        errorData.subtitle = "Error retrieving the data from GNB system, try later..."
        let error = Placeholder(data: errorData, style: retryStyle, key: .errorKey)
    
        
        var noResultsData: PlaceholderData = .noResults
        noResultsData.image = UIImage(named: "GNB")
        noResultsData.title = "No products available"
        noResultsData.subtitle = "There are no products available from GNB system"
        let noResults = Placeholder(data: noResultsData, style: retryStyle, key: .noResultsKey)
        
        var noConnectionData: PlaceholderData = .noConnection
        noConnectionData.image = UIImage(named: "Error")
        noConnectionData.title = "You are not connected"
        noConnectionData.subtitle = "Impossible to connect with GNB system..."
        let noConnection = Placeholder(data: noConnectionData, style: retryStyle, key: .noConnectionKey)
        
        let placeholdersProvider = PlaceholdersProvider(loading: loading, error: error, noResults: noResults, noConnection: noConnection)
                        
        return placeholdersProvider
    }

}
