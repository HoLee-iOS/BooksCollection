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

        //네비게이션 타이틀 추가
        navigationItem.title = ("책장")
        
        //네비게이션 아이템 추가
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: #selector(searchButtonClicked))
        
        
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
    
    //검색버튼 클릭하면 동작하는 함수
    @objc func searchButtonClicked() {
    
        //스토리보드 가져오기
        let sb = UIStoryboard(name: "Main", bundle: nil)
        
        //스토리보드 내에 뷰컨 가져오기
        let vc = sb.instantiateViewController(withIdentifier: SearchViewController.identifier
        ) as! SearchViewController
        
        //네비게이션 컨트롤러 임베드
        //검색창 내부에서 네비게이션 아이템을 사용할 것이기 때문에 임베드 해주는 것임
        let nav = UINavigationController(rootViewController: vc)
        
        //뷰컨 present 시 스타일 설정
        //네비게이션으로 임베드 해줬으므로 네비게이션 객체에 설정해줘야함
        nav.modalPresentationStyle = .fullScreen
        
        //네비게이션의 속성을 사용하지만 네비게이션의 push-pop 구조로 넘기지 않고 present로 화면 전환 구현
        self.present(nav, animated: true)
        
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
    
    @IBAction func detailButtonClicked(_ sender: UIButton) {
        
        //1. 스토리보드 파일 가져오기
        let sb = UIStoryboard(name: "Main", bundle: nil)
        //2. 스토리보드 내에 뷰컨트롤러 가져오기
        let vc = sb.instantiateViewController(withIdentifier: DetailPageViewController.identifier
        ) as! DetailPageViewController
        //3. 네비게이션의 푸쉬하는 방식으로 다음 화면 연결
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
}
