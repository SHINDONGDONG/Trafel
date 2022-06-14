//
//  PresenterManger .swift
//  Trafel
//
//  Created by 申民鐡 on 2022/06/14.
//

import UIKit


class PresenterManger {
    //다른곳에서 사용할 수 있게 shared
    static let shared = PresenterManger()
    
    private init(){}
    
    enum VC {
        
        case mainTabBarController
        case onboarding
    }
    
    //VC를 인자로 가져와서
    func show(vc: VC) {
        
        //viewcotnroller를 생성해주고
        var viewController: UIViewController
        
        //vc 에서 어떤게 오느냐에 따라 viewcontroller에 이동될 화면을 넣어준다.
        switch vc {
        
        case .mainTabBarController:
            viewController = UIStoryboard(name: K.StoryboardID.main, bundle: nil).instantiateViewController(withIdentifier: K.StoryboardID.mainTabBarController)
        case .onboarding:
            viewController = UIStoryboard(name: K.StoryboardID.main, bundle: nil).instantiateViewController(withIdentifier: K.StoryboardID.onboardingViewController)
        }
        
        //sceneDelegate로 이동시켜준다.
        if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate,
           let window = sceneDelegate.window {
            window.rootViewController = viewController

            //UIView 트랜지션으로 애니메이션을 추가시켜준다.
            UIView.transition(with: window, duration: 0.25, options: .transitionCrossDissolve, animations: nil, completion: nil)
        }
    }
}
