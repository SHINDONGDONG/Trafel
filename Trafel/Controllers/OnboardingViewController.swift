//
//  OnboardingViewController.swift
//  Trafel
//
//  Created by 申民鐡 on 2022/06/14.
//

import UIKit

protocol OnboardingDelegate:AnyObject {
    func showMainTabBarController()
}

class OnboardingViewController: UIViewController {
    

    // MARK: - Properties
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        configures()
    }
    
    // MARK: - Configures
    private func configures() {
        setupViews()
        setupCollectionView()
        setupPageControl()
    }
    
    private func setupPageControl(){
        pageControl.numberOfPages = Slide.collection.count
    }

    private func setupViews() {
        view.backgroundColor = .systemGroupedBackground
    }
    
    private func showCaption(atIndex index: Int) {
        let slide = Slide.collection[index]
        titleLabel.text = slide.title
        descriptionLabel.text = slide.description
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView.backgroundColor = .systemGroupedBackground
        collectionView.collectionViewLayout = layout
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    @IBAction func getStartedButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: K.Segue.showLoginSignUpScreen, sender: nil)
    }
    
    //prepare 세그웨이 참조만들기 segue웨이의 identfier가 showLoginSignup이라면
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.Segue.showLoginSignUpScreen {
            if let destination = segue.destination as? LoginViewController  {
                destination.delegate = self
            }
        }
    }

}

// MARK: - Extensions

extension OnboardingViewController:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Slide.collection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid", for: indexPath) as! OnboardingCollectionViewCell
        let imageName = Slide.collection[indexPath.item].imageName
        let image = UIImage(named: imageName) ?? UIImage()
        cell.configure(image: image)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let index = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
        showCaption(atIndex: index)
        self.pageControl.currentPage = index
    }
}

extension OnboardingViewController:OnboardingDelegate {
    func showMainTabBarController() {
        //가장 최상위 viewcontroller를 뜻한다.
        if let loginViewController = self.presentedViewController as? LoginViewController {
            loginViewController.dismiss(animated: true)
            PresenterManger.shared.show(vc: .mainTabBarController)
        }
    }
    
    
} 
