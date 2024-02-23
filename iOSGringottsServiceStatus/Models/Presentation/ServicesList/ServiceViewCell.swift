//
//  ServiceViewCell.swift
//  iOSGringottsServiceStatus
//
//  Created by Gardenia Mejia on 23/02/24.
//

import UIKit

protocol Reusable {
    static var reuseIdentifier: String { get }
}

extension Reusable {
    static var reuseIdentifier: String {
        String(describing: self)
    }
}

final class ServiceViewCell: UITableViewCell {
    
//    MARK: - Private properties
    
    private let nameLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .label
        return label
    }()
    
    private let stackStatus: UIStackView = {
        let stackView: UIStackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        return stackView
    }()
    
    private let iconStatus: UIImageView = {
        let icon: UIImageView = UIImageView()
        return icon
    }()
    
    private let statusLabel: UILabel = {
        let label: UILabel = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    private func setupUI() {
        selectionStyle = .none
        contentView.addSubview(nameLabel)
        stackStatus.addArrangedSubview(iconStatus)
        stackStatus.addArrangedSubview(statusLabel)
        contentView.addSubview(stackStatus)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            // stack
            stackStatus.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackStatus.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            stackStatus.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: stackStatus.leadingAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            iconStatus.heightAnchor.constraint(equalToConstant: 20.0),
            iconStatus.widthAnchor.constraint(equalToConstant: 20.0)
        ])
    }
    
    func configCell(service: ServiceStatus) {
        nameLabel.text = service.name
        
        switch service.httpCode {
        case 100...200:
            statusLabel.textColor = .systemGreen
            statusLabel.text = "\(service.httpCode) - Activo"
        default:
            statusLabel.textColor = .systemRed
            statusLabel.text = "\(service.httpCode) - Inactivo"
        }
    }
}
extension ServiceViewCell: Reusable {}
