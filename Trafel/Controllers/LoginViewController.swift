//
//  LoginViewController.swift
//  Trafel
//
//  Created by 申民鐡 on 2022/06/16.
//

import UIKit
import MBProgressHUD
import FirebaseAuth


class LoginViewController: UIViewController {

    private var errorMessage: String? {
        didSet {
            showErrorMessageIfNeeded(text: errorMessage)
        }
    }
    
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        emailTextField.becomeFirstResponder()
    }
    

    // MARK: - Configures
    
    private func setupViewFor(pagetype : pageType) {
//        errorLabel.text = ""
        errorMessage = nil
        passwordConfiramtionTextField.isHidden = pagetype == .login
        signUpButton.isHidden = pagetype == .login
        forgetPasswordButton.isHidden = pagetype == .signUp
        loginButton.isHidden = pagetype == .signUp
        
    }
    
    private func showErrorMessageIfNeeded(text: String?) {
        errorLabel.isHidden = text == nil
        errorLabel.text = text
    }
    

    @IBAction func forgetPasswordButtonTapped(_ sender: Any) {
    }
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
        let email = "kelvin@naver.com"
        let password = "123456"
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("email : \(error.localizedDescription)")
            }else {
                print("Success : \(result?.user.uid)")
            }
            
        }
    }

    @IBAction func loginButtonTapped(_ sender: Any) {
        //editing을 종료한다
        view.endEditing(true)
        
        //progress를 표시한다.
        MBProgressHUD.showAdded(to: view, animated: true)
        
        delay(durationInSeconds: 2.0) {
            //progress를 숨긴다.
            MBProgressHUD.hide(for: self.view, animated: true)
            
            if self.isSuccessfulLogin {
                self.delegate?.showMainTabBarController()
            }else {
                self.errorMessage = "Your Password is invalid. Plase try again."
            }
            
        }

    }
    
    
    @IBAction func segmentedControlChanged(_ sender: UISegmentedControl) {
        currentPageType = sender.selectedSegmentIndex == 0 ? .login : .signUp
        
    }
}
