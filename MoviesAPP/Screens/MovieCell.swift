//
//  MovieCell.swift
//  MoviesAPP
//
//  Created by Marcus on 31/03/22.
//

import UIKit
import Kingfisher

class MovieCell: UITableViewCell {
    
    private lazy var containerView: UIView = {
       let view = UIView()
        view.backgroundColor = .darkGray
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 20
        return view
    }()
    
    private lazy var posterView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        return label
    }()
    
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(model: Movie) {
        titleLabel.text = model.name
        
        guard let image = model.image?.medium,
              let imageURL = URL(string: image) else { return }
        posterView.kf.setImage(with: imageURL)
    }
}

extension MovieCell: ViewCode {
    func buildHierarchy() {
        contentView.addSubview(containerView)
        containerView.addSubview(stackView)
        containerView.addSubview(posterView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                  constant: 16),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                   constant: -16),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                                 constant: -16),
            
            posterView.topAnchor.constraint(equalTo: containerView.topAnchor),
            posterView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            posterView.widthAnchor.constraint(equalToConstant: 100),
            posterView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            
            stackView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: posterView.trailingAnchor,
                                              constant: 16),
            stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,
                                               constant: -16),
            ])
    }
    
    func applyAdditionalChanges() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
    }
}
