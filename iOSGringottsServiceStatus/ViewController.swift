//
//  ViewController.swift
//  iOSGringottsServiceStatus
//
//  Created by Gardenia Mejia on 23/02/24.
//

import UIKit

class MainViewController: UIViewController {
    
    private let mainStack: UIStackView = {
        let stackView: UIStackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        return stackView
    }()
    
    private let servicesList: ServicesListView = {
        let tableView: ServicesListView = ServicesListView(frame: .zero, style: .insetGrouped)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
        setConstraints()
    }
    
    private func setupUI() {
        title = "HP - API"
        view.backgroundColor = .systemBackground
        self.navigationController?.navigationBar.prefersLargeTitles = true
        mainStack.addArrangedSubview(servicesList)
        view.addSubview(mainStack)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            mainStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            mainStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
        ])
    }
}

