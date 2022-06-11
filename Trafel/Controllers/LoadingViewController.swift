//
//  LoadingViewController.swift
//  Trafel
//
//  Created by 申民鐡 on 2022/06/12.
//

import UIKit

class LoadingViewController: UIViewController {
 
    // MARK: - Properties
    private var isUserLoggedIn = true
    
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        configures()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //DispatchQueue로 비동기인데 딜레이를 준다. 2초동안 뺑글이돌고
        DispatchQueue.main.asyncAfter(deadline: .now()+2) {
            //showInitialView를 실행시킨다.
            self.showInitialView()
        }
    }

    // MARK: - Configures
    
    func configures() {
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .orange
    }
    
    private func showInitialView(){
         //user가 로그인 되어있으면 ==> main tab bar로 이동
         //user가 로그인 안 되어있으면 ==> onboarding 화면으로 이동
        
        if isUserLoggedIn {
            //MainTabBarController를 만들어준다.
            let mainTabBarController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier:"MainTabBarViewController")
            
            if let sceneDelegate = view.window?.windowScene?.delegate as? SceneDelegate,
                let window = sceneDelegate.window {
                window.rootViewController = mainTabBarController
            }
            
        }else {
            //지정해둔 identifier를 이용해서 화면을보내준다.
            performSegue(withIdentifier: "showOnboarding", sender: nil)
        }
         
    }


}
