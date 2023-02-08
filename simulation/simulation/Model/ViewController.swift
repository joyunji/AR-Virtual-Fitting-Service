//
//  ViewController.swift
//  simulation
//
//  Created by 이다민 on 2022/10/29.
//

import SwiftUI

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func Button_Start (_ sender: UIButton) {
        let vcName = self.storyboard?.instantiateViewController(withIdentifier:"PhoneCheckViewController")
        vcName?.modalPresentationStyle = .fullScreen //전체화면으로 보이게 설정
        vcName?.modalTransitionStyle = .crossDissolve //전환 애니메이션 설정
        self.present(vcName!, animated: true, completion: nil)
    }
}
