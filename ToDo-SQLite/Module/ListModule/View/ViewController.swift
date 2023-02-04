//
//  ViewController.swift
//  ToDo-SQLite
//
//  Created by Mehmet Ali Demir on 2.02.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var listTableView: UITableView!
    
    var noteList = [Notes]()
    
    var listPresenterObject : ViewToPresenterListProtocol?


    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        copyDatabase()
        ListRouter.createModule(ref: self)
    }
    
    func copyDatabase() {
        let bundlePath = Bundle.main.path(forResource: "todo", ofType: ".sqlite")
        let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let copyLocation = URL(fileURLWithPath: targetPath).appendingPathComponent("todo.sqlite")
        
        let fm = FileManager.default
        
        if fm.fileExists(atPath: copyLocation.path){
            print("veritabanı zaten var ")
        }else {
            do {
                try fm.copyItem(atPath:  bundlePath!, toPath: copyLocation.path)
                
            } catch {
                print(error.localizedDescription)
            }
            
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        listPresenterObject?.uploadNotes()
    }
    
    
    func setup() {
        searchBar.delegate = self
        listTableView.delegate = self
        listTableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            if let note = sender as? Notes {
                let goVC = segue.destination as! DetailViewController
                goVC.note = note
            }
        }
    }
}
extension ViewController : PresenterToViewListProtocol {
    func sendDataToView(noteList: [Notes]) {
        self.noteList = noteList
        self.listTableView.reloadData()
    }
  
}

extension ViewController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        listPresenterObject?.searchNote(searchWord: searchText)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noteList.count
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! NoteTableViewCell
        
        
        let note = noteList[indexPath.row]
        
        cell.noteTitle.text = note.note_name
        cell.noteDescription.text = note.note_description

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let note = noteList[indexPath.row]
        performSegue(withIdentifier: "toDetail", sender: note)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete"){ (contextualAction,view,bool) in
            let note = self.noteList[indexPath.row]
            
            let alert = UIAlertController(title: "Delete Note", message: "\(note.note_name!) is delete?", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            alert.addAction(cancelAction)
            
            let trueAction = UIAlertAction(title: "Yes", style: .destructive){ action in
                self.listPresenterObject?.deleteNote(note_id: note.note_id!)
            }
            alert.addAction(trueAction)
            
            self.present(alert, animated: true)
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    


}
