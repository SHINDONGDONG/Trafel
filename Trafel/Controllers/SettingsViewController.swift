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
        //onbarding 정보를 넣어준다.
        let onboardingViewController = UIStoryboard(name: K.StoryboardID.main, bundle: nil).instantiateViewController(withIdentifier: K.StoryboardID.onboardingViewController)
        
        //sceneDelegate로 이동시켜준다.
        if let sceneDelegate = view.window?.windowScene?.delegate as? SceneDelegate,
           let window = sceneDelegate.window {
            window.rootViewController = onboardingViewController
            
            //UIView 트랜지션으로 애니메이션을 추가시켜준다.
            UIView.transition(with: window, duration: 0.25, options: .transitionCrossDissolve, animations: nil, completion: nil)
        }
        
    }
}
