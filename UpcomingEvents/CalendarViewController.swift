//
//  ViewController.swift
//  UpcomingEvents
//
//  Created by Jose David Sanluis Castillo on 11/10/21.
//

import UIKit

class CalendarViewController: UIViewController {
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        return button
    }()
    
    private lazy var labelDescription: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        return tableView
    }()
    
    let cellReuseIdentifier = "cellId"
    let presenter: CalendarEventsPresenter
    
    private var sections: [[EventViewData]] = [] {
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
        stackView.addSubview(button)
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
        presenter.getEvents()
    }
    
//    func display(events: [EventViewData]) {
//        self.events = events
//    }
}

extension CalendarViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sections[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)

        cell.textLabel?.text = sections[indexPath.section][indexPath.row].title
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        " "
    }
}

extension CalendarViewController: UITableViewDelegate {
}

extension CalendarViewController: CalendarEventsViewDelegate {
    func display(events: [[EventViewData]]) {
        sections = events
    }
}
