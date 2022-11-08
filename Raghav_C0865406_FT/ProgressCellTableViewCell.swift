//
//  ProgressCellTableViewCell.swift
//  Raghav_C0865406_FT
//
//  Created by Raghav Dhawan on 08/11/22.
//

import UIKit

class ProgressCellTableViewCell: UITableViewCell {

    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var resultImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
