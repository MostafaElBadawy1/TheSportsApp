//
//  LeaguesTableViewCell.swift
//  The Sports App
//
//  Created by Mostafa Elbadawy on 20/06/2022.
//

import UIKit

protocol TableViewYT {
    func pressCell(index : Int)
}

class LeaguesTableViewCell: UITableViewCell {
   
    var cellDelegate : TableViewYT?
    var index: IndexPath?
    
    @IBOutlet weak var strLeagueBtnOutlet: UIButton!
    @IBOutlet weak var strBadge: UIImageView!
    
    @IBAction func strLeague(_ sender: UIButton) {
        cellDelegate?.pressCell(index: index!.row) 
    }
    @IBOutlet weak var strLeague: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
