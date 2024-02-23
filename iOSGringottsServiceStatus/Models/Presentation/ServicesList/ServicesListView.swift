//
//  ServicesListView.swift
//  iOSGringottsServiceStatus
//
//  Created by Gardenia Mejia on 23/02/24.
//
//
//  ServicesListView.swift
//  iOSGringottsServiceStatus
//
//  Created by Gardenia Mejia on 23/02/24.
//
import UIKit

enum Status: String {
    case active = "Activo"
    case inactive = "Inactivo"
}

struct Service {
    let name: String
    let route: String
    let status: Status
    let httpCode: String
}

final class ServicesListView: UITableView {
    
    var data: [ServiceStatus] = []
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: .insetGrouped)
        configTable()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configTable() {
        backgroundColor = .systemBackground
        separatorStyle = .none
        rowHeight = UITableView.automaticDimension
        estimatedRowHeight = 50.0
        allowsSelection = false
        delegate = self
        dataSource = self
        
        register(
            ServiceViewCell.self,
            forCellReuseIdentifier: ServiceViewCell.reuseIdentifier)
    }
}
extension ServicesListView: UITableViewDelegate {}
extension ServicesListView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: ServiceViewCell = tableView.dequeueReusableCell(withIdentifier: ServiceViewCell.reuseIdentifier, for: indexPath) as? ServiceViewCell
        else {
            return UITableViewCell()
        }
        cell.configCell(service: data[indexPath.row])
        return cell
    }
}
