//
//  PhotoCollectionView.swift
//  TestForDnepr
//
//  Created by Konstantin Chukhas on 05.11.2019.
//  Copyright © 2019 Konstantin Chukhas. All rights reserved.
//


import UIKit

class PhotoCollectionView: UICollectionViewController {
    var imageArray = [#imageLiteral(resourceName: "IMG_0D9B749CFF17-7"),#imageLiteral(resourceName: "IMG_0D9B749CFF17-11"),#imageLiteral(resourceName: "IMG_0D9B749CFF17-8"),#imageLiteral(resourceName: "IMG_0D9B749CFF17-14"),#imageLiteral(resourceName: "IMG_0D9B749CFF17-12"),#imageLiteral(resourceName: "IMG_0D9B749CFF17-4"),#imageLiteral(resourceName: "IMG_0D9B749CFF17-10"),#imageLiteral(resourceName: "IMG_0D9B749CFF17-6"),#imageLiteral(resourceName: "IMG_0D9B749CFF17-9"),#imageLiteral(resourceName: "IMG_0D9B749CFF17-2"),#imageLiteral(resourceName: "IMG_0D9B749CFF17-1"),#imageLiteral(resourceName: "IMG_0D9B749CFF17-15"),#imageLiteral(resourceName: "IMG_0D9B749CFF17-3"),#imageLiteral(resourceName: "IMG_0D9B749CFF17-13"),#imageLiteral(resourceName: "IMG_0D9B749CFF17-5")]
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .lightGray
        setupCollectionView()
        setupNavigationBar()
    }
    //MARK: - Setup UI elements
    private func setupNavigationBar() {
        let titleLabel = UILabel()
        titleLabel.text = "Photo"
        titleLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        titleLabel.textColor = #colorLiteral(red: 0.5019607843, green: 0.4980392157, blue: 0.4980392157, alpha: 1)
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: titleLabel)
    }
    private func setupCollectionView(){
        //регистрируем ячейку
        
        let layout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: PhotoCell.reuseId)
        collectionView.backgroundColor=UIColor.white
        self.view.addSubview(collectionView)
        
        collectionView.autoresizingMask = UIView.AutoresizingMask(rawValue: UIView.AutoresizingMask.RawValue(UInt8(UIView.AutoresizingMask.flexibleWidth.rawValue) | UInt8(UIView.AutoresizingMask.flexibleHeight.rawValue)))
    }
    
    // MARK: - UICollectionDataSourse, UIcollectionDelegate
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCell.reuseId, for: indexPath) as? PhotoCell
        let unsplashPhoto = imageArray[indexPath.item]
        cell?.photoImageView.image = unsplashPhoto
        return cell!
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
        let vc = ImagePreview()
        vc.imgArray = self.imageArray
        vc.passedContentOffset = indexPath
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
//MARK: - UICollectionViewDelegateFlowLayout
extension PhotoCollectionView:UICollectionViewDelegateFlowLayout{
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        if DeviceInfo.Orientation.isPortrait {
            return CGSize(width: width/4 - 1, height: width/4 - 1)
        } else {
            return CGSize(width: width/6 - 1, height: width/6 - 1)
        }
    }
    

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
}
