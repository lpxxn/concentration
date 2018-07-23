//
//  ChatModel.swift
//  ios11learn
//
//  Created by li on 2018/7/22.
//  Copyright © 2018年 li. All rights reserved.
//

import Foundation



class ChatModel: NSObject {
    var messageId: String?
    var messageContent: String = ""
    var messageContentType: MessageContentType = .Text
    var messageType: ChatMsgType = .Login
    var chatSendUid: String? //  发送人ID
    var chatReceivedUid: String? // 接收人ID
    //
    var fromMe: Bool {
        return self.chatSendUid == UserInstance.userId
    }
    init(text: String) {
        super.init()
        self.messageContent = text
        self.messageContentType = .Text
    }
    
}
