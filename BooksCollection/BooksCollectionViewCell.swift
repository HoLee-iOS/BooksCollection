//
//  BooksCollectionViewCell.swift
//  BooksCollection
//
//  Created by 이현호 on 2022/07/20.
//

import UIKit

class BooksCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookRate: UILabel!
    
    func configureCell(data: Book) {
        
        bookTitle.text = "\(data.title)"
        bookRate.text = "\(data.rate)"
        bookImageView.image = data.posterImage
        
    }
    
}
