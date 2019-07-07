//
//  DetailViewController.swift
//  函数式
//
//  Created by Rudy on 2019/7/6.
//  Copyright © 2019 Rudy. All rights reserved.
//

import UIKit


class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!


    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            if let label = detailDescriptionLabel {
                label.text = detail.description
            }
        }
    }
    
    override func loadView() {
        self.view = Bundle.main.loadNibNamed("Other", owner: self, options: nil)?.first as? UIView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        configureView()
    }

    var detailItem: NSDate? {
        didSet {
            // Update the view.
            configureView()
        }
    }


}

