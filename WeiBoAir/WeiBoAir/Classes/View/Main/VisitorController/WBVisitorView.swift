//
//  WBVisitorView.swift
//  WeiBoAir
//
//  Created by li on 2018/8/6.
//  Copyright © 2018年 li. All rights reserved.
//

import UIKit

class WBVisitorView: UIView {

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

extension WBVisitorView {
    @objc func setupUI() {
        backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    }
}
