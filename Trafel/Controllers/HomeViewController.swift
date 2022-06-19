//
//  HomeViewController.swift
//  Trafel
//
//  Created by 申民鐡 on 2022/06/19.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: - Properties
    
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        configures()
    }
    
    // MARK: - Configures
    private func configures(){
        setupNavigation()
    }
    
    private func setupNavigation(){
        title = K.NavigationTitle.home
    }


}
