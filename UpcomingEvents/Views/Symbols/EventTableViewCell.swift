//
//  EventTableViewCell.swift
//  UpcomingEvents
//
//  Created by Jose David Sanluis Castillo on 13/10/21.
//

import UIKit

final class EventTableViewCell: UITableViewCell {

    @IBOutlet weak var view: UIView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var lblStart: UILabel!
    @IBOutlet weak var lblEnd: UILabel!
    @IBOutlet weak var lblStatus: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        view.backgroundColor = AppColors.main.withAlphaComponent(0.1)
        view.layer.cornerRadius = 10
        
        lblStatus.textColor = .red
        lblStatus.font = UIFont.boldSystemFont(ofSize: 12)
    }

    func setup(viewData: EventViewData) {
        title?.text = viewData.title
        lblStart?.text = viewData.startDate
        lblEnd?.text = viewData.endDate
        lblStatus?.text = viewData.status
    }
}
