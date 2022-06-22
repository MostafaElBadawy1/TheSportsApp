//
//  UpcomingEventsTableViewCell.swift
//  The Sports App
//
//  Created by Mostafa Elbadawy on 21/06/2022.
//

import UIKit

class UpcomingEventsTableViewCell: UITableViewCell {
    var upcomtingEvents =  [UpcomtingEvents]()
    let leagueDetailsViewModel = LeagueDetailsViewModel()
    @IBOutlet weak var UpcomingEventsCollectionViewInTableViewCell: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        UpcomingEventsCollectionViewInTableViewCell.delegate = self
        UpcomingEventsCollectionViewInTableViewCell.dataSource = self
        UpcomingEventsCollectionViewInTableViewCell.register(UINib(nibName: "UpcomingEventsCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "UpcomingEventsCollectionViewCell")
        fetchUpcomtingEventsData()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
        func fetchUpcomtingEventsData() {
        Task.init {
            if let upcomtingEvents = await leagueDetailsViewModel.fetchUpcomingEvents() {
                self.upcomtingEvents = upcomtingEvents
                DispatchQueue.main.async {
               self.UpcomingEventsCollectionViewInTableViewCell.reloadData()
                }
            } else {
                print("error")
            }
        }
    }
}
extension UpcomingEventsTableViewCell: UICollectionViewDelegate {
    
}
extension UpcomingEventsTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return upcomtingEvents.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = UpcomingEventsCollectionViewInTableViewCell.dequeueReusableCell(withReuseIdentifier: "UpcomingEventsCollectionViewCell", for: indexPath) as! UpcomingEventsCollectionViewCell
        cell.strEvent.text = upcomtingEvents[indexPath.row].strEvent
        cell.dateLabel.text = upcomtingEvents[indexPath.row].dateEvent
        cell.timeLabel.text = upcomtingEvents[indexPath.row].strTime
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius =  cell.frame.height/4
        cell.layer.borderWidth = 2.5
        cell.layer.borderColor = UIColor.black.cgColor
        cell.clipsToBounds = true
        
        return cell
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 100
//    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 25
    }
    
}
// MARK: - CollectionViewDelegateFlowLayout
extension UpcomingEventsTableViewCell: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let leftAndRightPaddings: CGFloat = 1
        let numberOfItemsPerRow: CGFloat = 2.0
        let width = (collectionView.frame.width-leftAndRightPaddings)/numberOfItemsPerRow
        return CGSize(width: width, height: 160)
    }
}
