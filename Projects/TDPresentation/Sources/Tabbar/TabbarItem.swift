//
//  TabbarItem.swift
//  toduck
//
//  Created by 박효준 on 7/16/24.
//

import TDDesign
import UIKit

public enum TabbarItem: CaseIterable {
    case home, timer, diary, social, mypage
    
    var item: UITabBarItem {
        let tabBarItem: UITabBarItem
        
        switch self {
        case .home:
            tabBarItem = UITabBarItem(
                title: "홈",
                image: TDImage.Home.medium.withRenderingMode(.alwaysOriginal),
                selectedImage: TDImage.Home.colorMedium.withRenderingMode(.alwaysOriginal)
            )
            tabBarItem.tag = 0
        case .timer:
            tabBarItem = UITabBarItem(
                title: "집중",
                image: TDImage.Timer.medium.withRenderingMode(.alwaysOriginal),
                selectedImage: TDImage.Timer.colorMedium.withRenderingMode(.alwaysOriginal)
            )
            tabBarItem.tag = 1
        case .diary:
            tabBarItem = UITabBarItem(
                title: "일기",
                image: TDImage.Diary.medium.withRenderingMode(.alwaysOriginal),
                selectedImage: TDImage.Diary.colorMedium.withRenderingMode(.alwaysOriginal)
            )
            tabBarItem.tag = 2
        case .social:
            tabBarItem = UITabBarItem(
                title: "소셜",
                image: TDImage.Social.medium.withRenderingMode(.alwaysOriginal),
                selectedImage: TDImage.Social.colorMedium.withRenderingMode(.alwaysOriginal)
            )
            tabBarItem.tag = 3
        case .mypage:
            tabBarItem = UITabBarItem(
                title: "마이페이지",
                image: TDImage.Setting.bottomMedium.withRenderingMode(.alwaysOriginal),
                selectedImage: TDImage.Setting.bottomColorMedium.withRenderingMode(.alwaysOriginal)
            )
            tabBarItem.tag = 4
        }
        
        return tabBarItem
    }
}
