//
//  UICollectionView+.swift
//  toduck
//
//  Created by 승재 on 8/3/24.
//

import UIKit

public extension UICollectionView {
    func register(with type: UICollectionViewCell.Type) {
        register(type, forCellWithReuseIdentifier: type.identifier)
    }
    
    func register(with type: UICollectionReusableView.Type, elementKind: String) {
        register(type, forSupplementaryViewOfKind: elementKind, withReuseIdentifier: type.identifier)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as? T else {
            return .init()
        }
        return cell
    }
}
