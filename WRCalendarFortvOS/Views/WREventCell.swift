//
//  WREventCell.swift
//  Pods
//
//  Created by wayfinder on 2017. 4. 30..
//
//

import UIKit

class WREventCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var borderView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowRadius = 5
        layer.shadowOpacity = 0
        
        updateColors()
    }
    
    var event: WREvent? {
        didSet {
            if let event = event {
                titleLabel.text = event.title
                contentView.backgroundColor = event.backgroundColor
            }
        }
    }
    
    func updateColors() {
//        contentView.backgroundColor = UIColor(hexString: "21729c")!.withAlphaComponent(0.5)//
//        borderView.backgroundColor = UIColor.red.withAlphaComponent(0.5)//UIColor(hexString: "21729c")!.withAlphaComponent(0.5)
        titleLabel.textColor = UIColor.white
    }
}
