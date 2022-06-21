//
//  UpcomingEventsTableViewCell.swift
//  The Sports App
//
//  Created by Mostafa Elbadawy on 21/06/2022.
//

import UIKit

class UpcomingEventsTableViewCell: UITableViewCell {

    @IBOutlet weak var UpcomingEventsCollectionViewInTableViewCell: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        UpcomingEventsCollectionViewInTableViewCell.delegate = self
        UpcomingEventsCollectionViewInTableViewCell.dataSource = self
        UpcomingEventsCollectionViewInTableViewCell.register(UINib(nibName: "UpcomingEventsCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "UpcomingEventsCollectionViewCell")
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension UpcomingEventsTableViewCell: UICollectionViewDelegate {
    
}
extension UpcomingEventsTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = UpcomingEventsCollectionViewInTableViewCell.dequeueReusableCell(withReuseIdentifier: "UpcomingEventsCollectionViewCell", for: indexPath) as! UpcomingEventsCollectionViewCell
        cell.strEvent.text = "aaa"
        cell.dateLabel.text = "bbb"
        cell.timeLabel.text = "ccc"
        //cell.sectionHeader = "aa"
        return cell
    }
   
    
}
// MARK: - CollectionViewDelegateFlowLayout
extension UpcomingEventsTableViewCell: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let leftAndRightPaddings: CGFloat = 1
        let numberOfItemsPerRow: CGFloat = 2.0
        let width = (collectionView.frame.width-leftAndRightPaddings)/numberOfItemsPerRow
        return CGSize(width: width, height: width)
    }
}
