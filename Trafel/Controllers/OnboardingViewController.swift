//
//  OnboardingViewController.swift
//  Trafel
//
//  Created by 申民鐡 on 2022/06/14.
//

import UIKit

class OnboardingViewController: UIViewController {

    // MARK: - Properties
    
    
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        configures()
    }
    
    // MARK: - Configures
    private func configures() {
        setupViews()
    }
    
    private func setupViews() {
        view.backgroundColor = .systemRed
    }
    
    
    @IBAction func getStartedButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: K.Segue.showLoginSignUpScreen, sender: nil)
    }
    

}
