//
//  AddClassVC.swift
//  UClass
//
//  Created by Josia Mannuel on 27/05/20.
//  Copyright © 2020 Amos Ebenhaezer. All rights reserved.
//

import UIKit

protocol AddClassData {
    func sendClassData(className: String, classSubject: String, studentsEmail: [String])
}

class AddClassVC: UIViewController {
    
    var instaceHVC : HomeVC!
    
    

    @IBOutlet weak var studentEmails: UITextView!
    @IBOutlet weak var classSubjectTextfield: UITextField!
    @IBOutlet weak var classNameTextfield: UITextField!
    
    var delegate: AddClassData!
    
    var className: String? = ""
    var classSubject: String? = ""
    var studentsEmail: [String]? = [""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
       navigationController?.navigationBar.isHidden = true
    }
    
    
    
    @IBAction func createButton(_ sender: Any) {
        className = classNameTextfield.text
        classSubject = classSubjectTextfield.text
        studentsEmail = studentEmails.text.components(separatedBy: ", ")
        
        delegate?.sendClassData(className: className!, classSubject: classSubject!, studentsEmail: studentsEmail!)
        
        instaceHVC.tableView.reloadData()
        
        self.navigationController!.popToRootViewController(animated: true)
        
//        Services.
        
    }
    @IBAction func cancelBtn(_ sender: Any) {
        performSegue(withIdentifier: "toHome", sender: nil)
    }
    
//    func addTopic() {
//        var data: [String: Any]
//        
//        data = [
//            "topicTitle": titleTextField.text!,
//            "topicDescription": descriptionTextView.text!
//        ]
//        
//        Services.shared.addDiscussion(discussionData: data) {
//            print("DEBUG: Success create a topic!")
//        }
//    }
    
    
    

}
