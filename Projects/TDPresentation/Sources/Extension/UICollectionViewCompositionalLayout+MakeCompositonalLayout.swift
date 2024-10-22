//
//  UICollectionViewLayout+.swift
//  toduck
//
//  Created by 승재 on 8/3/24.
//


import UIKit

extension UICollectionViewCompositionalLayout {
    
    static func makeVerticalCompositionalLayout(
        itemSize: NSCollectionLayoutSize,
        itemEdgeSpacing: NSCollectionLayoutEdgeSpacing? = nil,
        groupSize: NSCollectionLayoutSize,
        subitemCount: Int = 1,
        groupInset: NSDirectionalEdgeInsets? = nil,
        groupEdgeSpacing: NSCollectionLayoutEdgeSpacing? = nil,
        sectionHeaderSize: NSCollectionLayoutSize? = nil
    ) -> UICollectionViewCompositionalLayout {
        
        return UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            if let edgeSpacing = itemEdgeSpacing {
                item.edgeSpacing = edgeSpacing
            }

            let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: Array(repeating: item, count: subitemCount))
            if let groupInset = groupInset {
                group.contentInsets = groupInset
            }
            if let groupEdgeSpacing = groupEdgeSpacing {
                group.edgeSpacing = groupEdgeSpacing
            }
            
            let section = NSCollectionLayoutSection(group: group)
            if let sectionHeaderSize = sectionHeaderSize {
                let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: sectionHeaderSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top)
                section.boundarySupplementaryItems = [sectionHeader]
            }
            
            return section
        }
    }
    
    static func makeHorizontalCompositionalLayout(
        itemSize: NSCollectionLayoutSize,
        edgeSpacing: NSCollectionLayoutEdgeSpacing? = nil,
        groupSize: NSCollectionLayoutSize,
        subitemCount: Int = 1,
        groupInset: NSDirectionalEdgeInsets? = nil,
        groupEdgeSpacing: NSCollectionLayoutEdgeSpacing? = nil,
        sectionHeader: NSCollectionLayoutBoundarySupplementaryItem? = nil
    ) -> UICollectionViewCompositionalLayout {
        
        return UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            if let edgeSpacing = edgeSpacing {
                item.edgeSpacing = edgeSpacing
            }

            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: Array(repeating: item, count: subitemCount))
            if let groupInset = groupInset {
                group.contentInsets = groupInset
            }
            if let groupEdgeSpacing = groupEdgeSpacing {
                group.edgeSpacing = groupEdgeSpacing
            }
            
            let section = NSCollectionLayoutSection(group: group)
            if let sectionHeader = sectionHeader {
                section.boundarySupplementaryItems = [sectionHeader]
            }
            section.orthogonalScrollingBehavior = .continuous
            
            return section
        }
    }
}
