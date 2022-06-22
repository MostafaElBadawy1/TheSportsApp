//
//  BookmarksViewController.swift
//  The Sports App
//
//  Created by Mostafa Elbadawy on 22/06/2022.
//

import UIKit

class BookmarksViewController: UIViewController {
    var bookmarksModel = [Bookmarks]()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchBookmarks()
    }
    
    func fetchBookmarks() {
        CoreDataManger.shared.fetch(entityName: Bookmarks.self) { (bookmarks) in
            self.bookmarksModel = bookmarks
            //            self.bookmarksModel.append(contentsOf: bookmarks)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    
}
extension BookmarksViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        bookmarksModel.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = bookmarksModel[indexPath.row].leagureTitle
        return cell
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        .delete
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            let item = bookmarksModel[indexPath.row]
            //delete
            CoreDataManger.shared.delete(entityName: Bookmarks.self, delete: item)
            CoreDataManger.shared.fetch(entityName: Bookmarks.self) { (item) in
                self.bookmarksModel = item
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }
    func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        let identifier = "\(String(describing: index))" as NSString
        return UIContextMenuConfiguration( identifier: identifier, previewProvider: nil) { [weak self]_ in
            let bookmarkAction = UIAction(title: "Bookmark", image: UIImage(systemName: "bookmark.fill")) { _ in
            }
            let safariAction = UIAction(
                title: "Open in Safari",
                image: UIImage(systemName: "link")) { _ in
                    self?.openInSafari(indexPath: indexPath)
                }
            let shareAction = UIAction(
                title: "Share",
                image: UIImage(systemName: "square.and.arrow.up")) { _ in
                    self?.shareUser(indexPath: indexPath)
                }
            let saveImage = UIAction(
                title: "Save Image",
                image: UIImage(systemName: "photo")) { _ in
                    self?.saveeImage(indexPath: indexPath)
                }
            return UIMenu(title: "", image: nil, children: [safariAction, bookmarkAction, saveImage, shareAction])
        }
    }
    //MARK:- LongPress Actions
    func openInSafari (indexPath: IndexPath) {
        
    }
    func shareUser (indexPath: IndexPath) {
        let usersURL = bookmarksModel[indexPath.row].leagureTitle
        let sheetVC = UIActivityViewController(activityItems: [usersURL], applicationActivities: nil)
        self.present(sheetVC, animated: true)
    }
    func saveeImage (indexPath: IndexPath) {
        
    }
    
}
