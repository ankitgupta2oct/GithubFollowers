//
//  GFAlertVC.swift
//  GHFollowers
//
//  Created by apple on 18/03/25.
//

import UIKit

class GFAlertVC: UIViewController {
    
    let continerView = UIView()
    let titleLabel = GFLabel(textAlignment: .center, fontSize: 20)
    let messageLabel = GFBodyLabel(textAlignment: .center)
    let actionButton = GFButton(backgroundColor: .systemPink, title: "Ok")
    let padding: CGFloat = 20
    
    var alertTitle: String?
    var message: String?
    var buttonTitle: String?

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(title: String, message: String, buttonTitle: String) {
        self.init(nibName: nil, bundle: nil)
                
        alertTitle = title
        self.message = message
        self.buttonTitle = buttonTitle
        
        configureContainerView()
        configureTitleLabel()
        configureActionButton()
        configureMessageLabel()
    }
    
    override func viewDidLoad() {
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
    }
    
    private func configureContainerView() {
        view.addSubview(continerView)
        
        continerView.backgroundColor = .systemBackground
        continerView.layer.cornerRadius = 16
        continerView.layer.borderWidth  = 2
        continerView.layer.borderColor  = UIColor.white.cgColor
        continerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            continerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            continerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            continerView.widthAnchor.constraint(equalToConstant: 280),
            continerView.heightAnchor.constraint(equalToConstant: 220),
        ])
    }
    
    private func configureTitleLabel() {
        continerView.addSubview(titleLabel)
        titleLabel.text = alertTitle ?? "Title"
                
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: continerView.topAnchor, constant: padding),
            titleLabel.leadingAnchor.constraint(equalTo: continerView.leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: continerView.trailingAnchor, constant: -padding),
            titleLabel.heightAnchor.constraint(equalToConstant: 28)
        ])
    }
    
    private func configureMessageLabel() {
        continerView.addSubview(messageLabel)
        messageLabel.text = message ?? "Message"
                
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 8),
            messageLabel.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -12),
            messageLabel.leadingAnchor.constraint(equalTo: continerView.leadingAnchor, constant: padding),
            messageLabel.trailingAnchor.constraint(equalTo: continerView.trailingAnchor, constant: -padding),
        ])
    }
    
    private func configureActionButton() {
        continerView.addSubview(actionButton)
        actionButton.setTitle(buttonTitle ?? "Ok", for: .normal)
        actionButton.addTarget(self, action: #selector(dismissAlert), for: .touchUpInside)
                
        NSLayoutConstraint.activate([
            actionButton.bottomAnchor.constraint(equalTo: continerView.bottomAnchor, constant: -padding),
            actionButton.leadingAnchor.constraint(equalTo: continerView.leadingAnchor, constant: padding),
            actionButton.trailingAnchor.constraint(equalTo: continerView.trailingAnchor, constant: -padding),
            actionButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    @objc private func dismissAlert() {
        dismiss(animated: true)
    }
}
