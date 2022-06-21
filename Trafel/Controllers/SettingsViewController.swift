//
//  SettingsViewController.swift
//  Trafel
//
//  Created by 申民鐡 on 2022/06/12.
//

import UIKit
import MBProgressHUD
import FirebaseAuth
import Loaf


class SettingsViewController: UIViewController {

    // MARK: - Properties
    let authManager = AuthManager()
    
    
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        configures()
    }

    // MARK: - Configures
    private func configures(){
        setupNavigationbar()
    }
    
    private func setupNavigationbar() {
        title = K.NavigationTitle.settings
    }

    @IBAction func logoutButtonTapped(_ sender: UIBarButtonItem) {
        //progress를 보여주고
        MBProgressHUD.showAdded(to: view, animated: true)
        //딜레이 0.5동안 progress가 돌아간다.
        delay(durationInSeconds: 0.5) { [ weak self ] in
            guard let this = self else { return }
            let result = this.authManager.logoutUser()
            switch result {
            case .failure(let error):
                Loaf(error.localizedDescription, state: .error, location: .top,sender: this).show()
                
            case .success:
                PresenterManger.shared.show(vc: .onboarding)
            }
            MBProgressHUD.hide(for: this.view, animated: true)
            
            
//            do {
//                //지금 로그인되어있는 auth를 signOut시켜주고
//                try Auth.auth().signOut()
//                //onboarding으로 이동시켜준다.
//                PresenterManger.shared.show(vc: .onboarding)
//            } catch {
//                print(error.localizedDescription)
//                //error일경우 progress를 멈춰준다.
//            }
        }
        
    }
}
