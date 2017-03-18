//
//  postCell.swift
//  Imst
//
//  Created by Yawen on 17/3/2017.
//  Copyright © 2017 Ya-Wen Chu. All rights reserved.
//

import UIKit
import Parse
import ParseUI


class postCell: UITableViewCell {
    
    @IBOutlet weak var photoView: PFImageView!
    @IBOutlet weak var caption: UILabel!
    
    var post: PFObject! {
        willSet {
            self.photoView.file = newValue["media"] as? PFFile
            self.photoView.loadInBackground()
            self.caption.text = newValue["caption"] as? String
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
