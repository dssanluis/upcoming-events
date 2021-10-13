//
//  DetailEventViewController.swift
//  UpcomingEvents
//
//  Created by Jose David Sanluis Castillo on 13/10/21.
//

import UIKit

final class DetailEventViewController: UIViewController {
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        let textFieldCell = UINib(nibName: "EventTableViewCell",
                                  bundle: nil)
        tableView.register(textFieldCell, forCellReuseIdentifier: "EventTableViewCell")
        return tableView
    }()
    
    let presenter: CalendarEventsPresenter
    
    private var sections: [EventViewData] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(presenter: CalendarEventsPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
    }
    
    override func loadView() {
        super.loadView()
        title = "Eventos"
        view.backgroundColor = .white
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(tableView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        presenter.setViewDelegate(calendarEventsViewDelegate: self)
        
        let guide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([stackView.topAnchor.constraint(equalTo: guide.topAnchor),
                                     stackView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
                                     stackView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
                                     stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension DetailEventViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EventTableViewCell", for: indexPath) as? EventTableViewCell else { return UITableViewCell() }
        
        let viewData = sections[indexPath.row]
        cell.setup(viewData: viewData)
        
        return cell
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return sections[section].first?.headerTitle ?? ""
//    }
}

extension DetailEventViewController: UITableViewDelegate {
}

extension DetailEventViewController: CalendarEventsViewDelegate {
    func display(events: [[EventViewData]]) {
//        sections = events
    }
}
