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
        let textFieldCell = UINib(nibName: "EventTableViewCell",
                                  bundle: nil)
        tableView.register(textFieldCell, forCellReuseIdentifier: "EventTableViewCell")
        let headerFieldCell = UINib(nibName: "HeaderTableViewCell",
                                    bundle: nil)
        tableView.register(HeaderTableViewCell.self, forHeaderFooterViewReuseIdentifier: "HeaderTableViewCell")
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = true
        tableView.separatorStyle = .none
        tableView.alwaysBounceVertical = true
        tableView.rowHeight = UITableView.automaticDimension
        return tableView
    }()
    
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EventTableViewCell", for: indexPath) as? EventTableViewCell else { return UITableViewCell() }
        
        let viewData = sections[indexPath.section][indexPath.row]
        cell.setup(viewData: viewData)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].first?.headerTitle ?? ""
    }
}

extension CalendarViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let header = view as? UITableViewHeaderFooterView {
            header.textLabel?.textColor = .white //UIColor.wmColor(color: .greyishBrown)
            header.contentView.backgroundColor = AppColors.main
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewData = sections[indexPath.section][indexPath.row]
        presenter.getEventDetail(idEvent: viewData.id)
        print("***")
    }
}

extension CalendarViewController: CalendarEventsViewDelegate {
    func display(events: [[EventViewData]]) {
        sections = events
    }
}
