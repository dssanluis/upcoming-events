//
//  ViewController.swift
//  UpcomingEvents
//
//  Created by Jose David Sanluis Castillo on 11/10/21.
//

import UIKit

class ViewController: UIViewController, TrafficLightViewDelegate {

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
        }
    }
    
    let cellReuseIdentifier = "cell"

    
    private var events: [Event] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.setViewDelegate(trafficLightViewDelegate: self)
    }
    
    var presenter: CalendarEventsPresenter = CalendarEventsPresenter(service: EventsService())

    @IBAction func didTapBtn(_ sender: Any) {
        presenter.getEvents()
    }
    
    func displayTrafficLight(description:(String)) {
        labelDescription.text = description
    }
    
    func display(events: [Event]) {
        self.events = events
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell? ?? UITableViewCell()

        cell.textLabel?.text = events[indexPath.row].title
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
}
