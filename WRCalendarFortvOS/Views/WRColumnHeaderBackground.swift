//
//  WRColumnHeaderBackground.swift
//
//  Created by wayfinder on 2017. 4. 5..
//  Copyright © 2017년 revo. All rights reserved.
//

import UIKit

class WRColumnHeaderBackground: UICollectionReusableView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear//UIColor.white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
