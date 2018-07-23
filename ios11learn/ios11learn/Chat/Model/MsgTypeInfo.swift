//
//  MsgTypeInfo.swift
//  ios11learn
//
//  Created by li on 2018/7/22.
//  Copyright © 2018年 li. All rights reserved.
//

import Foundation

enum MessageContentType: String {
    case Text = "0"
    case Image = "1"
    case Voice = "2"
    case System = "3"
    case File = "4"
    case Time = "110"
}

enum ChatMsgType: String {
    case Login = "login"
    case Group = "sayToGroup"
    case Personal = "sayToC"
    case UserList = "pageList"
}



