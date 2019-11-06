//
//  MainTabBarController .swift
//  TestForDnepr
//
//  Created by Konstantin Chukhas on 04.11.2019.
//  Copyright © 2019 Konstantin Chukhas. All rights reserved.
//

import Foundation
import UIKit
class MainTabBarController:UITabBarController{
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        //Помещаем 2 вьюшки
        //1 поиск фото Коллекшн вью
        //создаем массив контроллеров в таб баре
        let photosVC = PhotoCollectionView(collectionViewLayout: UICollectionViewFlowLayout())
        viewControllers = [generateNavigationVC(rootViewController: MainViewController(), title: "Main", image: #imageLiteral(resourceName: "heart")),
            generateNavigationVC(rootViewController: photosVC, title: "Photo", image: #imageLiteral(resourceName: "photos"))]
    }
   
    private func generateNavigationVC(rootViewController :UIViewController,title:String,image:UIImage) -> UIViewController{
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        return navigationVC
        
    }
}
