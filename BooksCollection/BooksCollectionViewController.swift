//
//  BooksCollectionViewController.swift
//  BooksCollection
//
//  Created by 이현호 on 2022/07/20.
//

import UIKit


class BooksCollectionViewController: UICollectionViewController {

    var bookList = BookInfo()
    var colors: [UIColor] = [.purple,.orange,.systemIndigo,.systemBlue,.magenta]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //컬렉션뷰의 속성 설정
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 8
        let width = UIScreen.main.bounds.width - (spacing * 3)
        layout.itemSize = CGSize(width: width / 2, height: width / 2)
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        collectionView.collectionViewLayout = layout
     
    }

    //아이템을 몇개 만들 것인지 설정하는 함수
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bookList.book.count
    }
    
    //셀 파일의 데이터를 받아오고 셀에 대한 속성을 설정하는 함수
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BooksCollectionViewCell", for: indexPath) as! BooksCollectionViewCell
        
        let data = bookList.book[indexPath.row]
        cell.configureCell(data: data)
        cell.bookTitle.textColor = .white
        cell.bookRate.textColor = .systemGray5
        cell.layer.cornerRadius = 15
        cell.backgroundColor = colors.randomElement()!
        
        return cell
        
        
    }
    
}
