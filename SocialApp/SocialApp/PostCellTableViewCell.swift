//
//  PostCellTableViewCell.swift
//  SocialApp
//
//  Created by AamirNakhwa on 11/14/18.
//  Copyright © 2018 AamirNakhwa. All rights reserved.
//

import UIKit

class PostCellTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var lblID: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblBody: UILabel!
    @IBOutlet weak var lblUser: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
