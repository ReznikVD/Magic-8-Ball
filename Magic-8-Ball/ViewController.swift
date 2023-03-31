//
//  ViewController.swift
//  Magic-8-Ball
//
//  Created by Владислав Резник on 31.03.2023.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Subviews
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 30)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Ask Me Anything..."
        return label
    }()
    
    private lazy var ballIMageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.isHidden = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var questionButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Ask", for: .normal)
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        button.layer.cornerRadius = 7
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(questionButtonPressed(_:)), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Internal vars
    
    private let ballImages = [
        UIImage(named: "ball1"),
        UIImage(named: "ball2"),
        UIImage(named: "ball3"),
        UIImage(named: "ball4"),
        UIImage(named: "ball5")
        ]

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
}

// MARK: - Internal Methods

private extension ViewController {
    func setupUI() {
        view.backgroundColor = .systemBlue
        
        view.addSubview(titleLabel)
        view.addSubview(ballIMageView)
        view.addSubview(questionButton)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: -20),
            ballIMageView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            ballIMageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0),
            ballIMageView.widthAnchor.constraint(equalToConstant: 300),
            ballIMageView.heightAnchor.constraint(equalToConstant: 300),
            questionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
            questionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            questionButton.heightAnchor.constraint(equalToConstant: 50),
            questionButton.widthAnchor.constraint(equalToConstant: 100)
            ])
    }
    
    @objc func questionButtonPressed(_ sender: UIButton) {
        ballIMageView.isHidden = false
        
        ballIMageView.image = ballImages[Int.random(in: ballImages.startIndex..<ballImages.endIndex)]
    }
}

