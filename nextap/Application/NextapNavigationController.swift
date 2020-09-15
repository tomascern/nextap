//
//  NextapNavigationController.swift
//  nextap
//
//  Created by Tomáš Černý on 14/09/2020.
//  Copyright © 2020 Tomáš Černý. All rights reserved.
//

import UIKit

class NextapNavigationController: UINavigationController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setNavigationBarHidden(true, animated: animated)
    }
}
