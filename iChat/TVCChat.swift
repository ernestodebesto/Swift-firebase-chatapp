//
//  TVCChat.swift
//  iChat
//
//  Created by Filip Sikora on 06/12/2017.
//  Copyright © 2017 Xcode. All rights reserved.
//

import UIKit

class TVCChat: UITableViewCell {

    @IBOutlet weak var laMessage: UITextView!
    @IBOutlet weak var laUserName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func setChat(chat:Chat) {
        laUserName.text = chat.userName
        laMessage.text = chat.text
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
