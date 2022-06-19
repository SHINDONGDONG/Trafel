//
//  LoadingViewController.swift
//  Trafel
//
//  Created by 申民鐡 on 2022/06/12.
//

import UIKit

class LoadingViewController: UIViewController {
 
    // MARK: - Properties
    private var isUserLoggedIn = false
    
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        configures()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //helper에서 만들었던 delay 메서드
        delay(durationInSeconds: 2.0) {
            self.showInitialView()
        }
    }

    // MARK: - Configures
    
    func configures() {
    }
    
    private func showInitialView(){
         //user가 로그인 되어있으면 ==> main tab bar로 이동
         //user가 로그인 안 되어있으면 ==> onboarding 화면으로 이동
        
        if isUserLoggedIn {
            PresenterManger.shared.show(vc: .mainTabBarController)
            
        }else {
            //지정해둔 identifier를 이용해서 화면을보내준다.
            performSegue(withIdentifier: K.Segue.showOnboarding, sender: nil)
        }
         
    }


}
