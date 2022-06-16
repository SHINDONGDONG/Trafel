//
//  SettingsViewController.swift
//  Trafel
//
//  Created by 申民鐡 on 2022/06/12.
//

import UIKit
import MBProgressHUD

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
        MBProgressHUD.showAdded(to: view, animated: true)
        delay(durationInSeconds: 0.5) {
            MBProgressHUD.hide(for: self.view, animated: true)
            PresenterManger.shared.show(vc: .onboarding)
        }
        
    }
}
