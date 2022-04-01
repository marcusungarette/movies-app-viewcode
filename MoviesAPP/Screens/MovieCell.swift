//
//  MovieCell.swift
//  MoviesAPP
//
//  Created by Marcus on 31/03/22.
//

import UIKit

class MovieCell: UITableViewCell {
    
    private lazy var containerView: UIView = {
       let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 20
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MovieCell: ViewCode {
    func buildHierarchy() {
        contentView.addSubview(containerView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                  constant: 16),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                   constant: -16),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                                 constant: -16)
        ])
    }
    
    func applyAdditionalChanges() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
    }
}
