//
//  ViewController.swift
//  PendoDemo
//
//  Created by Ondřej Stašek on 19.01.2023.
//

import UIKit
import View
import SwiftUI
import Pendo

class ViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        PendoManager.shared().startSession(nil, accountId: "demo", visitorData: nil, accountData: nil)
    }

}

extension ViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        2
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        let content: HistoryWidget.Content

        switch indexPath.row {
        case 0:
            content = .empty(message: "Nothing to show")
        case 1:
            content = .list(
                [
                    .workOrder(name: "AAA", id: 1),
                    .asset(name: "BBB", id: 2)
                ]
            )
        default:
            fatalError()
        }

        let historyWidget = HistoryWidget.View(
            title: "History Widget",
            content: content
        )
        let hostingCtrl = UIHostingController(
            rootView: historyWidget
        )
        hostingCtrl.view.frame = CGRect(x: 0, y: 0, width: 300, height: 200)

        cell.contentView.subviews.forEach { $0.removeFromSuperview() }
        cell.contentView.addSubview(hostingCtrl.view)
        return cell
    }

}
