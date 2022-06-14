//
//  SettingsViewController.swift
//  Trafel
//
//  Created by 申民鐡 on 2022/06/12.
//

import UIKit

class SettingsViewController: UIViewController {

    // MARK: - Properties
    
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        configures()
    }
    

    // MARK: - Configures
    private func configures(){
        setupView()
    }
    
    private func setupView(){
        view.backgroundColor = .systemGray
    }

    @IBAction func logoutButtonTapped(_ sender: UIBarButtonItem) {
        PresenterManger.shared.show(vc: .onboarding)
        
    }
}
