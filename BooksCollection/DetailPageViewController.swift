//
//  DetailPageViewController.swift
//  BooksCollection
//
//  Created by 이현호 on 2022/07/21.
//

import UIKit

class DetailPageViewController: UIViewController {

    static let identifier = "DetailPageViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func webButtonClicked(_ sender: UIButton) {
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: WebViewController.identifier) as! WebViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
        
    }
    
}
