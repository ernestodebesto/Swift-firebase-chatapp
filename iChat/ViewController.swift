//
//  ViewController.swift
//  iChat
//
//  Created by Filip Sikora on 04/12/2017.
//  Copyright © 2017 Xcode. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listAllChatInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellChat:TVCChat = tableView.dequeueReusableCell(withIdentifier:"cellChat" , for: indexPath) as! TVCChat
        cellChat.setChat(chat: listAllChatInfo[indexPath.row])
        return cellChat
    }
    
    
    var loginName:String?
    var ref = DatabaseReference.init()
    
    @IBOutlet weak var chatList: UITableView!
    @IBOutlet weak var txtChatText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        //         Do any additional setup after loading the view, typically from a nib.
        
        self.ref = Database.database().reference()
        authenticate()
        chatList.delegate = self
        chatList.dataSource = self
        
    }
    
    
    var listAllChatInfo = [Chat]()
    
    func loadChat() {
        self.ref.child("chat").queryOrdered(byChild: "date").observe( .value, with:
            { ( snapshot ) in
                
                self.listAllChatInfo.removeAll()
                
                if let snapshot = snapshot.children.allObjects as? [DataSnapshot]{
                    
                    for snap in snapshot {
                        if let postData = snap.value as? [String:AnyObject]{
                            let userName = postData["name"] as? String
                            let text = postData["message"] as? String
                            let date = postData["date"] as? Int
                            
                            self.listAllChatInfo.append(Chat(userName: userName!, text: text!, date: "\(date!)"))
                        }
                    }
                    
                    self.chatList.reloadData()
                    let indexpath = IndexPath(row: self.listAllChatInfo.count-1 , section: 0)
                    self.chatList.scrollToRow(at: indexpath, at:  .bottom, animated: false)
                }
                
        })
    }
    
    
    
    
    func authenticate() {
        Auth.auth().signInAnonymously() {
            (user,error) in
            
            if let error = error {
                print("blad")
            } else {
                print("twoj userID to \(user!.uid)")
                self.loadChat()
            }
            
        }
        
    }
    
    
    
    @IBAction func buSend(_ sender: Any) {
        let dic = ["message" : txtChatText.text,
                   "name" : loginName!,
                   "date" : ServerValue.timestamp()] as [String:Any]
        self.ref.child("chat").childByAutoId().setValue(dic)
    }
    
    
}




