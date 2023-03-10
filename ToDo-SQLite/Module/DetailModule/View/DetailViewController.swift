//
//  DetailViewController.swift
//  ToDo-SQLite
//
//  Created by Mehmet Ali Demir on 2.02.2023.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var noteTextField: UITextField!
    
    @IBOutlet weak var noteDescriptionTextField: UITextField!
    var note:Notes?
    
    var detailPresenterObject :ViewToPresenterDetailProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        DetailRouter.createModule(ref: self)
        
        if let n = note {
            noteTextField.text = n.note_name
            noteDescriptionTextField.text = n.note_description
        }
    }

    @IBAction func updatedButton(_ sender: Any) {
        if let noteName = noteTextField.text, let noteDescription = noteDescriptionTextField.text , let n = note {
            detailPresenterObject?.update(note_id: n.note_id!, note_name: noteName, note_description: noteDescription)
        }
    }
}
