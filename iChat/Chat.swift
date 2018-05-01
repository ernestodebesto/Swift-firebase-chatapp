//
//  Chat.swift
//  iChat
//
//  Created by Filip Sikora on 06/12/2017.
//  Copyright © 2017 Xcode. All rights reserved.
//

import UIKit


class Chat: NSObject {
    var userName:String?
    var date:String?
    var text:String
    init(userName:String, text:String, date:String) {
        self.userName = userName
        self.text = text
        self.date = date
    }
}

