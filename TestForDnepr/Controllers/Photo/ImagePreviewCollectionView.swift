//
//  ImagePreviewVCCollectionViewController.swift
//  TestForDnepr
//
//  Created by Konstantin Chukhas on 05.11.2019.
//  Copyright © 2019 Konstantin Chukhas. All rights reserved.
//

import UIKit
class ImagePreview:  UIViewController,UICollectionViewDelegate,UICollectionViewDataSource{
    var myCollectionView: UICollectionView!
    var imgArray = [UIImage]()
    var passedContentOffset = IndexPath()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupNavigationBar()
    }
    //MARK: - Setup UI elements
    private func setupNavigationBar() {
        let leftBarButton = UIBarButtonItem.init(title: "Preview", style: UIBarButtonItem.Style.plain, target: self, action: #selector(backToRootVCAction))
        self.navigationItem.setLeftBarButton(leftBarButton, animated: true)
      
        let rightBarButton = UIBarButtonItem.init(title: "Next", style: UIBarButtonItem.Style.plain, target: self, action: #selector(nextToRootVCAction))
        self.navigationItem.setRightBarButton(rightBarButton, animated: true)
      
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
    }
   
    @objc func backToRootVCAction() {
        _ = self.navigationController?.popToRootViewController(animated: true)
    }
    @objc func nextToRootVCAction() {
        _ = self.navigationController?.popToRootViewController(animated: true)
    }
    private func setupCollectionView(){
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        myCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        myCollectionView.delegate=self
        myCollectionView.dataSource=self
        myCollectionView.register(ImagePreviewCell.self, forCellWithReuseIdentifier: ImagePreviewCell.reuseId)
        myCollectionView.isPagingEnabled = true
        myCollectionView.scrollToItem(at: passedContentOffset, at: .left, animated: true)
        myCollectionView.selectItem(at: passedContentOffset, animated: true, scrollPosition: .bottom)
        self.view.addSubview(myCollectionView)
        
        myCollectionView.autoresizingMask = UIView.AutoresizingMask(rawValue: UIView.AutoresizingMask.RawValue(UInt8(UIView.AutoresizingMask.flexibleWidth.rawValue) | UInt8(UIView.AutoresizingMask.flexibleHeight.rawValue)))
    }
    
    // MARK: - UICollectionDataSourse, UIcollectionDelegate
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImagePreviewCell.reuseId, for: indexPath) as? ImagePreviewCell
//        passedContentOffset = indexpath.item
        cell?.photoImageView.image = imgArray[indexPath.item]
        return cell!
    }
    
    
}
//MARK: - UICollectionViewDelegateFlowLayout
extension ImagePreview:UICollectionViewDelegateFlowLayout{
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        guard let flowLayout = myCollectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        
        flowLayout.itemSize = myCollectionView.frame.size
        
        flowLayout.invalidateLayout()
        
        myCollectionView.collectionViewLayout.invalidateLayout()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        let offset = myCollectionView.contentOffset
        let width  = myCollectionView.bounds.size.width
        
        let index = round(offset.x / width)
        let newOffset = CGPoint(x: index * size.width, y: offset.y)
        
        myCollectionView.setContentOffset(newOffset, animated: false)
        
        coordinator.animate(alongsideTransition: { (context) in
            self.myCollectionView.reloadData()
            
            self.myCollectionView.setContentOffset(newOffset, animated: false)
        }, completion: nil)
    }
}

