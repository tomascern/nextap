//
//  FeedPresenter.swift
//  nextap
//
//  Created by Tomáš Černý on 14/09/2020.
//  Copyright (c) 2020 Tomáš Černý. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import Foundation
import Alamofire

final class FeedPresenter {

    // MARK: - Private properties -

    private unowned let view: FeedViewInterface
    private let interactor: FeedInteractorInterface
    private let wireframe: FeedWireframeInterface
    
    private var feedResult: FeedResult = FeedResult(data: []) {
        didSet {
            view.reloadData()
        }
    }

    // MARK: - Lifecycle -

    init(view: FeedViewInterface, interactor: FeedInteractorInterface, wireframe: FeedWireframeInterface) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

// MARK: - Extensions -

extension FeedPresenter: FeedPresenterInterface {
    
    func didSelectItem(at indexPath: IndexPath) {
        wireframe.openDetail(at: indexPath, withStories: feedResult.data, previewDelegate: self)
    }
    
    
    func item(at indexPath: IndexPath) -> Story {
        return feedResult.data[indexPath.row]
    }
    
    func viewDidLoad() {
        interactor.fetchStories { (response) -> (Void) in
            self.handleFeedResults(response.result)
        }
    }
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfItems(in section: Int) -> Int {
        return feedResult.data.count
    }
    
    
    
    private func handleFeedResults(_ result: Result<FeedResult, AFError>) {
        switch result{
            
        case .success(let value):
            feedResult = value
        case .failure(_):
            print("Failed")
        }
    }
}

extension FeedPresenter: PreviewDelegate{
    func setActiveIndexPath(indexPath: IndexPath) {
        view.scrollToIndex(indexPath: indexPath)
    }
    
    
}
