//
//  ChatBaseCell.swift
//  ios11learn
//
//  Created by li on 2018/7/21.
//  Copyright © 2018年 li. All rights reserved.
//

import UIKit

private let chatNicknameLabelHeight: CGFloat = 20
let chatAvatarMarginLeft: CGFloat = 10 // 头像的margin left
let chatAvatarMarginTop: CGFloat = 0
let chatAvatarWidth: CGFloat = 40

class ChatBaseCell: UITableViewCell {

    @IBOutlet weak var avtarImageView: UIImageView! {
        didSet{
            avtarImageView.backgroundColor = UIColor.clear
            avtarImageView.constraintWH(width: chatAvatarWidth, height: chatAvatarWidth)
        }
    }
    
    @IBOutlet weak var nicknameLabel: UILabel! {
        didSet{
            nicknameLabel.font = .systemFont(ofSize: 11)
            nicknameLabel.textColor = .darkGray
        }
    }
    
    override func prepareForReuse() {
        self.avtarImageView.image = nil
        self.nicknameLabel.text = nil
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
        self.contentView.backgroundColor = .clear
        self.backgroundColor = .clear
        
        // 头像点击
//        let tap = UITapGestureRecognizer()
//        self.avtarImageView.addGestureRecognizer(tap)
//        self.avtarImageView.isUserInteractionEnabled = true
//
//
    }
    
    func setCellContent(_ model: ChatModel) {
        
    }
    
    override func layoutSubviews() {
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension UIView {
    func constraintWH(width: CGFloat, height: CGFloat) {
        self.addConstraint(NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: height))
        self.addConstraint(NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: width))
    }
}







