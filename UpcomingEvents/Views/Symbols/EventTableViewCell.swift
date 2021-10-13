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
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setup(viewData: EventViewData) {
        title?.text = viewData.title
        lblStart?.text = viewData.startDate
        lblEnd?.text = viewData.endDate
        
    }
}
