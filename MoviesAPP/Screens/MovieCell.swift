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
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 20
        return view
    }()
    
    private lazy var blur: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .dark)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        return blurView
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
    
    private lazy var genresLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        return label
    }()
    
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, genresLabel, ratingStackView])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 8
        return stackView
    }()
    
    private lazy var ratingStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [starImage, ratingLabel])
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 8
        return stackView
    }()
    
    private lazy var ratingLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var starImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "star")
        imageView.tintColor = .yellow
        return imageView
    }()
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(model: Movie) {
        titleLabel.text = model.name
        genresLabel.text = model.genres?.joined(separator: ", ")
        ratingLabel.text = model.rating?.average?.toString()
        
        guard let image = model.image?.medium,
              let imageURL = URL(string: image) else { return }
        posterView.kf.setImage(with: imageURL)
    }
}

extension MovieCell: ViewCode {
    func buildHierarchy() {
        contentView.addSubview(containerView)
        containerView.addSubview(blur)
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
            
            blur.topAnchor.constraint(equalTo: containerView.topAnchor),
            blur.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            blur.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            blur.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            
            starImage.widthAnchor.constraint(equalToConstant: 20),
            starImage.heightAnchor.constraint(equalToConstant: 20),
            ])
    }
    
    func applyAdditionalChanges() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
    }
}
