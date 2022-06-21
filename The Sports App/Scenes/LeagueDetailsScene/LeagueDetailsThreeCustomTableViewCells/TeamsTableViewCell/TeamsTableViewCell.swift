//
//  TeamsTableViewCell.swift
//  The Sports App
//
//  Created by Mostafa Elbadawy on 21/06/2022.
//

import UIKit

class TeamsTableViewCell: UITableViewCell {
    @IBOutlet weak var teamsCollectionViewInTableViewCell: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
        teamsCollectionViewInTableViewCell.delegate = self
        teamsCollectionViewInTableViewCell.dataSource = self
        teamsCollectionViewInTableViewCell.register(UINib(nibName: "TeamsCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "TeamsCollectionViewCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension TeamsTableViewCell: UICollectionViewDelegate {
    
}
extension TeamsTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = teamsCollectionViewInTableViewCell.dequeueReusableCell(withReuseIdentifier: "TeamsCollectionViewCell", for: indexPath) as! TeamsCollectionViewCell
        cell.teamName.text = "Ahly"
        return cell
    }
    
    
}
// MARK: - CollectionViewDelegateFlowLayout
extension TeamsTableViewCell: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let leftAndRightPaddings: CGFloat = 1
        let numberOfItemsPerRow: CGFloat = 2.0
        let width = (collectionView.frame.width-leftAndRightPaddings)/numberOfItemsPerRow
        return CGSize(width: width, height: width)
    }
}
