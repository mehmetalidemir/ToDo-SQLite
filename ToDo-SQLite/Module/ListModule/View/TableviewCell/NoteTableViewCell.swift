//
//  NoteTableViewCell.swift
//  ToDo-SQLite
//
//  Created by Mehmet Ali Demir on 2.02.2023.
//

import UIKit

class NoteTableViewCell: UITableViewCell {
    @IBOutlet weak var noteDescription: UILabel!
    
    @IBOutlet weak var noteTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
