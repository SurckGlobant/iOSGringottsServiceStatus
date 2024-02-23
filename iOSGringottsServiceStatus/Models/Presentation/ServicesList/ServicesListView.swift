//
//  ServicesListView.swift
//  iOSGringottsServiceStatus
//
//  Created by Gardenia Mejia on 23/02/24.
//
import UIKit

final class ServicesListView: UITableView {
    
    init() {
        super.init(frame: .zero, style: .plain)
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
        
        register(<#T##cellClass: AnyClass?##AnyClass?#>, forCellReuseIdentifier: <#T##String#>)
    }
}
