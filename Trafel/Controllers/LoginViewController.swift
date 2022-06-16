//
//  LoginViewController.swift
//  Trafel
//
//  Created by 申民鐡 on 2022/06/16.
//

import UIKit

class LoginViewController: UIViewController {

    weak var delegate :OnboardingDelegate?
    
    private let isSuccessfulLogin = true
    
    // MARK: - Properties
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var passwordConfiramtionTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var forgetPasswordButton: UIButton!
    
    private enum pageType {
        case login
        case signUp
    }
    
    private var currentPageType: pageType = .login {
        didSet {
            setupViewFor(pagetype: currentPageType)
        }
    }
    
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewFor(pagetype: .login)
    }
    

    // MARK: - Configures
    
    private func setupViewFor(pagetype : pageType) {
        errorLabel.text = ""
        passwordConfiramtionTextField.isHidden = pagetype == .login
        signUpButton.isHidden = pagetype == .login
        forgetPasswordButton.isHidden = pagetype == .signUp
        loginButton.isHidden = pagetype == .signUp
        
    }

    @IBAction func forgetPasswordButtonTapped(_ sender: Any) {
    }
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
    }
    @IBAction func loginButtonTapped(_ sender: Any) {
        
        if isSuccessfulLogin {
            delegate?.showMainTabBarController()
        }else {
            
        }
    }
    
    @IBAction func segmentedControlChanged(_ sender: UISegmentedControl) {
        currentPageType = sender.selectedSegmentIndex == 0 ? .login : .signUp
        
    }
}
