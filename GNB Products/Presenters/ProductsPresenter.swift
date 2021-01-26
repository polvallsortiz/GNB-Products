//
//  ProductsPresenter.swift
//  GNB Products
//
//  Created by Pol Valls Ortiz on 21/1/21.
//

import Foundation

protocol ProductsViewDelegate: NSObjectProtocol {
    func setProducts(products: [Product])
    func errorProducts()
}

class ProductsPresenter {
    private let productsService : ProductsService
    private let ratesService : RatesService
    weak private var productsViewDelegate : ProductsViewDelegate?
    
    private var transactions : [Transaction]
    
    init(productsService : ProductsService, ratesService : RatesService) {
        self.productsService = productsService
        self.ratesService = ratesService
        transactions = [Transaction]()
    }
    
    func setViewDelegate(productsViewDelegate : ProductsViewDelegate?) {
        self.productsViewDelegate = productsViewDelegate
    }
    
    //All functions from view
    func getData() {
        DispatchQueue.global(qos: .default).async {
            self.ratesService.apiRatesRequest { (rates, error) in
                if(!error) {
                    self.productsService.apiProductsRequest(rates: rates, completionHandler: { (transactions, error) -> Void in
                        if(!error) {
                            self.transactions = transactions
                            var productsSKUs = Set<String>()
                            var products = [Product]()
                            for transaction in transactions {
                                if !productsSKUs.contains(transaction.sku) {
                                    productsSKUs.insert(transaction.sku)
                                    products.append(Product(transaction : transaction, rates: rates))
                                }
                                else {
                                    if let productIndex = products.firstIndex(where: {$0.name == transaction.sku}) {
                                        products[productIndex].addTransaction(transaction: transaction)
                                    }
                                }
                            }
                            DispatchQueue.main.async {
                                self.productsViewDelegate?.setProducts(products: products)
                            }
                        }
                        else {
                            DispatchQueue.main.async {
                                self.productsViewDelegate?.errorProducts()
                            }
                        }
                    })
                }
                else {
                    DispatchQueue.main.async {
                        self.productsViewDelegate?.errorProducts()
                    }
                }
            }
        }
    }
}
