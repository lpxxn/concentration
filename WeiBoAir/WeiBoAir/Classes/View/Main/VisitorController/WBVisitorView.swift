//
//  WBVisitorView.swift
//  WeiBoAir
//
//  Created by li on 2018/8/6.
//  Copyright © 2018年 li. All rights reserved.
//

import UIKit

class WBVisitorView: UIView {

    lazy var registerButton: UIButton = UIButton.lp_textButton(title: "注册", fontSize: 16, normalColor: UIColor.orange, highlightedColor: .black, backgroundImgName: "common_button_white_disable")
    lazy var loginButton: UIButton = UIButton.lp_textButton(title: "登录", fontSize: 16, normalColor: UIColor.orange, highlightedColor: .black, backgroundImgName: "common_button_white_disable")
    
    var visitorInfo:[String: String]? {
        didSet {
            guard let imgName = visitorInfo?["imgName"],
            let msg = visitorInfo?["msg"] else {
                return
            }
            tipLabel.text = msg
            
            if imgName.isEmpty {
                startAnimation()
                return
            }
            iconView.image = UIImage(named: imgName)
            
            // 不显示小房子和遮罩
            hoseIconView.isHidden = true
            maskIconView.isHidden = true
            
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -私有控件
    // iconview
    private lazy var iconView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_smallicon"))
    // host
    private lazy var hoseIconView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_house"))
    
    // mask
    private lazy var maskIconView = UIImageView(image: UIImage(named: "visitordiscover_feed_mask_smallicon"))
    
    // tip label
    private lazy var tipLabel:UILabel = UILabel.lp_labelWidthText(text: "一去二三里，山村四五家。亭台六七座，八九十支花。", fontSize: 16, color: .orange)
    
    // message
    //private lazy var msgIconView = UIImageView(image: UIImage(named: "visitordiscover_image_message"))
    
    // person
    //private lazy var profileIconView = UIImageView(image: UIImage(named: "visitordiscover_image_profile"))
    
    private func startAnimation() {
        let anim = CABasicAnimation(keyPath: "transform.rotation")
        anim.toValue = 2 * Double.pi
        anim.repeatCount = MAXFLOAT
        anim.duration = 15
        anim.isRemovedOnCompletion = false
        iconView.layer.add(anim, forKey: nil)
    }
}

extension WBVisitorView {
    @objc func setupUI() {
        backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.9176470588, blue: 0.9176470588, alpha: 1)
        
        addSubview(iconView)
        addSubview(hoseIconView)
        addSubview(maskIconView)
        addSubview(tipLabel)
        addSubview(registerButton)
        addSubview(loginButton)
//        addSubview(msgIconView)
//        addSubview(profileIconView)
        
        tipLabel.textAlignment = .center
        
        // 取消 autoresizing
        for v in subviews {
            v.translatesAutoresizingMaskIntoConstraints = false
        }
        
        // iconView
        addConstraints([NSLayoutConstraint(item: iconView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0),
                        NSLayoutConstraint(item: iconView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: -50)])
        
        // hose
        addConstraints([NSLayoutConstraint(item: hoseIconView, attribute: .centerX, relatedBy: .equal, toItem: iconView, attribute: .centerX, multiplier: 1.0, constant: 0),
                        NSLayoutConstraint(item: hoseIconView, attribute: .centerY, relatedBy: .equal, toItem: iconView, attribute: .centerY, multiplier: 1.0, constant: 0)])
        
        // mask
        addConstraints([NSLayoutConstraint(item: maskIconView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 0),
                        NSLayoutConstraint(item: maskIconView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: 0),
                        NSLayoutConstraint(item: maskIconView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0)])
        //
        if UIDevice.current.userInterfaceIdiom == .pad {
            addConstraint(NSLayoutConstraint(item: maskIconView, attribute: .bottom, relatedBy: .equal, toItem: iconView, attribute: .bottom, multiplier: 1.0, constant: 180))
        } else {
            addConstraint(NSLayoutConstraint(item: maskIconView, attribute: .bottom, relatedBy: .equal, toItem: iconView, attribute: .bottom, multiplier: 1.0, constant: 90))
        }
        
        // tiplabel
        addConstraints([NSLayoutConstraint(item: tipLabel, attribute: .centerX, relatedBy: .equal, toItem: iconView, attribute: .centerX, multiplier: 1.0, constant: 0),
                        NSLayoutConstraint(item: tipLabel, attribute: .top, relatedBy: .equal, toItem: iconView, attribute: .bottom, multiplier: 1.0, constant: 20),
                        NSLayoutConstraint(item: tipLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 236)])
        
        // register button
        addConstraints([NSLayoutConstraint(item: registerButton, attribute: .leading, relatedBy: .equal, toItem: tipLabel, attribute: .leading, multiplier: 1.0, constant: 0),
                        NSLayoutConstraint(item: registerButton, attribute: .top, relatedBy: .equal, toItem: tipLabel, attribute: .bottom, multiplier: 1.0, constant: 10),
                        NSLayoutConstraint(item: registerButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 100)])
        
        // login button
        addConstraints([NSLayoutConstraint(item: loginButton, attribute: .trailing, relatedBy: .equal, toItem: tipLabel, attribute: .trailing, multiplier: 1.0, constant: 0),
                        NSLayoutConstraint(item: loginButton, attribute: .top, relatedBy: .equal, toItem: tipLabel, attribute: .bottom, multiplier: 1.0, constant: 10),
                        NSLayoutConstraint(item: loginButton, attribute: .width, relatedBy: .equal, toItem: registerButton, attribute: .width, multiplier: 1.0, constant: 0)])
        
    }
}









