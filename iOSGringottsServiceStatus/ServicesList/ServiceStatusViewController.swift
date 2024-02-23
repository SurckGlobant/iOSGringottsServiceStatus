//
//  ServiceStatusViewController.swift
//  iOSGringottsServiceStatus
//
//  Created by Gardenia Mejia on 23/02/24.
//

//
// ServiceStatusViewController.swift
// iOSGringottsServiceStatus
//
// Created by Gardenia Mejia on 23/02/24.
//
import UIKit
import RxSwift
final class ServiceStatusViewController: UIViewController {
    var viewModel: ServiceViewModelProtocol
    let disposeBag = DisposeBag()
    
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
        self.view.backgroundColor = .gray
        fetchAllServiceStatus()
    }
    init(viewModel: ServiceViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        setupUI()
        setConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
    
    func fetchAllServiceStatus() {
        viewModel.fetchAllServiceStatus()
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] status in
                // Aquí manejas los estados de los servicios uno por uno
                self?.servicesList.data.append(status)
                self?.servicesList.reloadData()
                print("Status: \(status)")
            }, onError: { [weak self] error in
                // Manejar cualquier error que ocurra durante la solicitud
                print("Error: \(error)")
            }, onCompleted: {
                // Aquí manejas la notificación de que todos los servicios han terminado
                print("Todos los servicios han terminado.")
            })
            .disposed(by: disposeBag)
    }
}
