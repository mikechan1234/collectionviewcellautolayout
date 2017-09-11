//
//  SampleCollectionViewCell.swift
//  
//
//  Created by Michael on 11/9/2017.
//
//

import UIKit

public class SampleCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!

    @IBOutlet public weak var textLabel: UILabel!
    @IBOutlet weak var subTextLabel: UILabel!
        
    public override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
    }

}
