//
//  ProductsTableViewCell.swift
//  GNB Products
//
//  Created by Pol Valls Ortiz on 20/1/21.
//

import UIKit

class ProductsTableViewCell: UITableViewCell {

    @IBOutlet weak var productName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
