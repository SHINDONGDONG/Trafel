//
//  HomeViewController.swift
//  Trafel
//
//  Created by 申民鐡 on 2022/06/19.
//

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {

    // MARK: - Properties
    @IBOutlet weak var emailLabel: UILabel!
    
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        configures()
    }
    
    // MARK: - Configures
    private func configures(){
        setupNavigation()
        setupViews()
    }
    
    private func setupViews(){
        if let email = Auth.auth().currentUser?.email {
            emailLabel.text = email
        } else {
            emailLabel.text = "Something is terribly wrong!"
        }
    }
    
    private func setupNavigation(){
        title = K.NavigationTitle.home
    }


}
