//
//  ProductsViewController.swift
//  GNB Products
//
//  Created by Pol Valls Ortiz on 20/1/21.
//

import UIKit
import HGPlaceholders

class ProductsViewController: UIViewController {

    @IBOutlet weak var productsTable: TableView!
    var refreshControl = UIRefreshControl()

    
    private let productsPresenter = ProductsPresenter(productsService: ProductsService(), ratesService: RatesService())
    
    var products = [Product]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productsTable.delegate = self
        productsTable.dataSource = self
        productsTable.placeholdersProvider = .gnb
        productsTable.placeholderDelegate = self
        productsTable.showLoadingPlaceholder()
        
        //Pull to refresh implementation
        refreshControl.attributedTitle = NSAttributedString(string: "Refresh from GNB")
        self.refreshControl.addTarget(self, action: #selector(refresh), for: UIControl.Event.valueChanged)
        productsTable.addSubview(refreshControl)
        
        //Presenter
        productsPresenter.setViewDelegate(productsViewDelegate: self)
        productsPresenter.getData()
    }
    
    @objc func refresh(sender: AnyObject) {
        productsPresenter.getData()
    }

}

extension ProductsViewController : UITableViewDelegate, UITableViewDataSource, PlaceholderDelegate, ProductsViewDelegate {
    
    func view(_ view: Any, actionButtonTappedFor placeholder: Placeholder) {
        productsTable.showLoadingPlaceholder()
        productsPresenter.getData()
    }
    
    func setProducts(products: [Product]) {
        refreshControl.endRefreshing()
        self.products = products
        if(products.count <= 0) { productsTable.showNoResultsPlaceholder() }
        else {
            productsTable.showDefault()
            productsTable.reloadData()
        }
    }
    
    func errorProducts() {
        refreshControl.endRefreshing()
        productsTable.showErrorPlaceholder()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productsCell", for: indexPath as IndexPath) as! ProductsTableViewCell
        cell.productName.text = products[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "productDetailViewController") as? ProductDetailViewController
        vc?.product = products[indexPath.row]
        vc?.transactions = products[indexPath.row].transactions
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    
}
