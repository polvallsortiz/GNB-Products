//
//  ProductDetailViewController.swift
//  GNB Products
//
//  Created by Pol Valls Ortiz on 22/1/21.
//

import UIKit

class ProductDetailViewController: UIViewController {
    
    @IBOutlet weak var transactionsTable: UITableView!
    @IBOutlet weak var transactionsLabel: UILabel!
    @IBOutlet weak var totalEURLabel: UILabel!
    
    
    var product : Product?
    var transactions = [Transaction]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        transactionsTable.delegate = self
        transactionsTable.dataSource = self
        transactionsLabel.text = "\(transactions.count) transactions"
        totalEURLabel.text = "Total: \(product?.totalEUR.formattedAmount ?? "0.00")€"
        self.title = product?.name ?? " "
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ProductDetailViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productDetailCell", for: indexPath as IndexPath) as! ProductDetailTableViewCell
        cell.originalAmountLabel.text = "\(transactions[indexPath.row].currency) " + transactions[indexPath.row].amount.formattedAmount!
        cell.eurAmountLabel.text = "\(transactions[indexPath.row].eurAmount.formattedAmount ?? "0.00") €"
        return cell
    }
    
}
