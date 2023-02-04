//
//  RegistrationViewController.swift
//  ToDo-SQLite
//
//  Created by Mehmet Ali Demir on 2.02.2023.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    @IBOutlet weak var noteTextField: UITextField!
    @IBOutlet weak var noteDescriptionTextField: UITextField!
    
    var RegistrationPresenterObject:ViewToPresenterRegistrationProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        RegistrationRouter.createModule(ref: self)

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveButton(_ sender: Any) {
        if let noteName = noteTextField.text , let noteDescription = noteDescriptionTextField.text {
            RegistrationPresenterObject?.noteSave(note_name: noteName, note_description: noteDescription)
        }
    }
}
