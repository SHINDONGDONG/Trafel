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

    let authManager = AuthManager()
    
    private var errorMessage: String? {
        didSet {
            showErrorMessageIfNeeded(text: errorMessage)
        }
    }
    
    weak var delegate :OnboardingDelegate?
    
    //firebase를 사용하고 있으니 이제 필요없음
//    private let isSuccessfulLogin = true
    
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
        
        //정보 유효성 확인 빈곳이 있는지 없는지
        guard let email = emailTextField.text, !email.isEmpty,
        let password = passwordTextField.text, !password.isEmpty,
        let passwordConfiramtion = passwordConfiramtionTextField.text, !passwordConfiramtion.isEmpty
        else {
            showErrorMessageIfNeeded(text: "Invaild From")
            return
        }
        //패스워드 유효성 확인.
        guard password == passwordConfiramtion else {
            showErrorMessageIfNeeded(text: "Password are incorrect")
            return
        }
        
        //progress
        MBProgressHUD.showAdded(to: view, animated: true)

        //create User
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            //self의 optinal
            guard let this = self else { return }
        
            MBProgressHUD.hide(for: this.view, animated: true)
            if let error = error {
                self?.showErrorMessageIfNeeded(text: error.localizedDescription)
                //userid가 만들어진다면 userid를 넣어주고 maintabbarcontroller에 보내준다,.
            }else if let userId = result?.user.uid {
                this.delegate?.showMainTabBarController()
                print("userid created : \(userId)")
            }

        }
    }

    @IBAction func loginButtonTapped(_ sender: Any) {
        //editing을 종료한다
        view.endEditing(true)
        //텍스트필드에 입력된 email, password를 담아준다.
        guard let email = emailTextField.text,
                !email.isEmpty,
              let password = passwordTextField.text,
                !password.isEmpty else {
            showErrorMessageIfNeeded(text: "Invaild")
            return
        }
        //progress를 표시한다.
        MBProgressHUD.showAdded(to: view, animated: true)

        authManager.loginUser(withEmail: email, password: password) { [weak self] result in
            guard let this = self else { return }
            MBProgressHUD.hide(for: this.view, animated: true)
            switch result {
            case .failure(let error):
                this.showErrorMessageIfNeeded(text: error.localizedDescription)
            case .success:
                this.delegate?.showMainTabBarController()
            }
        }
        

//        authManager.signUpNewUser(withEmail: email, password: password) { [weak self] result in
//            guard let this = self else { return }
//            MBProgressHUD.hide(for: this.view, animated: true)
//            switch result {
//            case .success:
//                this.delegate?.showMainTabBarController()
//            case .failure(let error):
//                this.showErrorMessageIfNeeded(text: error.localizedDescription)
//            }
//        }
        
        //firebase인증 절차를 거친 후 로그인을 시도한다.
//        Auth.auth().signIn(withEmail: email, password: password) { [weak self ] (result, error) in
//            guard let this = self else { return }
//            //progress를 끈다.
//            MBProgressHUD.hide(for: this.view, animated: true)
//            //error일경우 errormeassge에 error내용을 표시해주고
//            if let error = error {
//                this.showErrorMessageIfNeeded(text: error.localizedDescription)
//                //result일경우 tabbarcotnroller로 넘긴다.
//            } else if let _ = result?.user.uid {
//                this.delegate?.showMainTabBarController()
//            }
//        }
//
        
//        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
//          guard let strongSelf = self else { return }
//        }
//        delay(durationInSeconds: 2.0) {
//            //progress를 숨긴다.
//            MBProgressHUD.hide(for: self.view, animated: true)
//
//            if self.isSuccessfulLogin {
//                self.delegate?.showMainTabBarController()
//            }else {
//                self.errorMessage = "Your Password is invalid. Plase try again."
//            }
//
//        }

    }
    
    
    @IBAction func segmentedControlChanged(_ sender: UISegmentedControl) {
        currentPageType = sender.selectedSegmentIndex == 0 ? .login : .signUp
        
    }
}
