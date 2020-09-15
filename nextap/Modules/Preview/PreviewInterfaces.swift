//
//  PreviewInterfaces.swift
//  nextap
//
//  Created by Tomáš Černý on 14/09/2020.
//  Copyright (c) 2020 Tomáš Černý. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

protocol PreviewWireframeInterface: WireframeInterface {
    func dismissButtonTouched()
}

protocol PreviewViewInterface: ViewInterface {
    func addStoryView(view : StoryView)
    func scrollToImage(at index: IndexPath)
}

protocol PreviewPresenterInterface: PresenterInterface {
    func viewDidLayoutSubviews()
    func dismissButtonTouched()
    func getItem(at: Int) -> Story
    func previewIndexChanged(to newIndex: Int)
}

protocol PreviewInteractorInterface: InteractorInterface {
}

protocol PreviewDelegate{
    func setActiveIndexPath(indexPath: IndexPath)
}
