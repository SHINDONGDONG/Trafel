//
//  OnboardingViewController.swift
//  Trafel
//
//  Created by 申民鐡 on 2022/06/14.
//

import UIKit

class OnboardingViewController: UIViewController {

    // MARK: - Properties
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        configures()
    }
    
    // MARK: - Configures
    private func configures() {
        setupViews()
        setupCollectionView()
    }
    
    private func setupViews() {
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
    
}
