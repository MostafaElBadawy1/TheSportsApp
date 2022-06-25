//
//  TeamsCollectionViewCell.swift
//  The Sports App
//
//  Created by Mostafa Elbadawy on 21/06/2022.
//

import UIKit

class TeamsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var teamImage: UIImageView!
    @IBOutlet weak var teamName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        teamImage.addGestureRecognizer(tap)
        teamImage.isUserInteractionEnabled = true
    }
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        GlobalNotificationCenter().nc.post(name: Notification.Name("present"), object: nil)
    }
}
class GlobalNotificationCenter {
    let nc = NotificationCenter.default
}
