//
//  ProductDetailTableViewCell.swift
//  GNB Products
//
//  Created by Pol Valls Ortiz on 22/1/21.
//

import UIKit

class ProductDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var originalAmountLabel: UILabel!
    @IBOutlet weak var eurAmountLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
