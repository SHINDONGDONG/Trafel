//
//  AuthManager.swift
//  Trafel
//
//  Created by 申民鐡 on 2022/06/21.
//

import Foundation
import FirebaseAuth
import MBProgressHUD


struct AuthManager {
    //Auth.auth()를 만들어놓는다.
    let auth = Auth.auth()
    //Error를 enum으로 만들어놓는다 리스트
    enum AuthError: Error {
        case unkownError
    }
   
     func isUserLogged() -> Bool {
        return auth.currentUser != nil
    }
    
    //Signup할 때 의 auth인증을 한다. //email, password 가 인자로온다.
    func signUpNewUser(withEmail email:String, password:String, completion: @escaping (Result<User, Error>) -> Void ) {
        //firebase의 createuser로 유저를 생성한다.
        auth.createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                completion(.failure(error))
            } else if let user = result?.user {
                completion(.success(user))
            } else {
                completion(.failure(AuthError.unkownError))
            }
        }
    }
    
    func loginUser(withEmail email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        auth.signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                completion(.failure(error))
            } else if let user = result?.user {
                completion(.success(user))
            } else {
                completion(.failure(AuthError.unkownError))
            }
        }
    }

    //Password를 email로 찾는 메서드
    func resetPassword(withEmail email: String, completion: @escaping (Result<Void, Error>) -> Void) {
        auth.sendPasswordReset(withEmail: email) { (error) in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(()))
            }
        }
//        Auth.auth().sendPasswordReset(withEmail: email) { error in
//          // ...
//        }
    }
    
    func logoutUser() -> Result<Void,Error> {
        //데이터를 넘길것이 없으므로 void로 해준다.
        do {
            try auth.signOut()
            return .success(())
        } catch(let error) {
            return .failure(error)
        }
    }
    
}
