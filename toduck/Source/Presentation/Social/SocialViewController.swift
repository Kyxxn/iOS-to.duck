//
//  SocialViewController.swift
//  toduck
//
//  Created by 박효준 on 7/15/24.
//

import UIKit

class SocialViewController: BaseViewController<SocialView>, TDSheetPresentation {
    
    private let searchBar = UISearchBar()
    private var filteredPosts: [Post] = []
    
    let chips: [TDChipItem] = [
        TDChipItem(title: "집중력"),
        TDChipItem(title: "기억력"),
        TDChipItem(title: "충돌"),
        TDChipItem(title: "불안"),
        TDChipItem(title: "수면"),
    ]
    
    var posts: [Post] = Post.dummy
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configure() {
        layoutView.socialFeedCollectionView.register(with: SocialFeedCollectionViewCell.self)
        layoutView.socialFeedCollectionView.dataSource = self
        layoutView.socialFeedCollectionView.delegate = self
        layoutView.chipCollectionView.chipDelegate = self
        layoutView.chipCollectionView.setChips(chips)
    }
    
    override func addView() {
        
    }
    
    override func layout() {
        
    }
    
    override func binding() {
        
    }
}

extension SocialViewController: TDChipCollectionViewDelegate {
    func chipCollectionView(_ collectionView: TDChipCollectionView, didSelectChipAt index: Int, chipText: String) {
        print("[LOG] 현재 Select 한 Chip: \(chipText) , Index = : \(index)")
        layoutView.hideDropdown()
    }
}

extension SocialViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: SocialFeedCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        let post = posts[indexPath.item]
        cell.socialFeedCellDelegate = self
        cell.configure(with: post)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        layoutView.hideDropdown()
    }
}

extension SocialViewController: SocialFeedCollectionViewCellDelegate{
    func didTapNickname(_ cell: SocialFeedCollectionViewCell) {
        
    }

    func didTapMoreButton(_ cell: SocialFeedCollectionViewCell) {
    
    }
    
    func didTapCommentButton(_ cell: SocialFeedCollectionViewCell) {
        print("[LOG] Comment Button Clicked")
    }

    func didTapShareButton(_ cell: SocialFeedCollectionViewCell) {
        print("[LOG] Share Button Clicked")
    }

    func didTapLikeButton(_ cell: SocialFeedCollectionViewCell) {
        print("[LOG] Like Button Clicked")
        guard let indexPath = layoutView.socialFeedCollectionView.indexPath(for: cell) else {
            return
        }
        
        let postIndex = indexPath.item
        posts[postIndex].isLike.toggle()
        cell.configure(with: posts[postIndex])
    }
}
