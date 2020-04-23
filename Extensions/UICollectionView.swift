//
//  UICollectionView.swift
//  streak
//
//  Created by  Jared on 4/14/20.
//  Copyright © 2020 jaredmbourgeois. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionViewFlowLayout {
    convenience init(
        scrollDirection: UICollectionView.ScrollDirection = .horizontal,
        minimumInteritemSpacing: CGFloat = 0,
        minimumLineSpacing: CGFloat = 0
    ) {
        self.init()
        self.scrollDirection = scrollDirection
        self.minimumInteritemSpacing = minimumInteritemSpacing
        self.minimumLineSpacing = minimumLineSpacing
    }
}
