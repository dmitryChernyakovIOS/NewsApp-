//
//  MyCustomTableViewCell.swift
//  exsampleTableView
//
//  Created by Дмитрий Богданович on 25.01.23.
//

import UIKit

class MyCustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ImageofNews: UIImageView!
    
    @IBOutlet weak var mainText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
