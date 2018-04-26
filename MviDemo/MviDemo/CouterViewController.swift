//
//  CouterViewController.swift
//  MviDemo
//
//  Created by Dogether on 25/04/18.
//  Copyright © 2018 Dogether. All rights reserved.
//

import UIKit
import ReactorKit
import RxCocoa
import RxSwift

class CouterViewController: UIViewController,StoryboardView {
    var disposeBag: DisposeBag = DisposeBag()

    @IBOutlet weak var bIncreament: UIButton!
    @IBOutlet weak var lNumber: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.reactor = CounterReactor(number: 10)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func bind(reactor: CounterReactor) {
        bIncreament.rx.tap
            .map{Reactor.Action.increament}
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        reactor.state.map{"\($0.value)"}
            .bind(to: lNumber.rx.text)
            .disposed(by: disposeBag)
        
    }
}
