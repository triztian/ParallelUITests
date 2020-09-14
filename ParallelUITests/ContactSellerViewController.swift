//
//  ContactSellerViewController.swift
//  ParallelUITests
//
//  Created by Tristian Azuara on 9/13/20.
//  Copyright © 2020 Tristian Azuara. All rights reserved.
//

import Foundation
import UIKit

final class ContactSellerViewController: UIViewController {
    @IBAction func tapCancel(_ sender: Any) {
        dismiss(animated: true)
    }

    @IBAction func tapSend(_ sender: Any) {
        DispatchQueue.main.async {
            let messageSentAlert = UIAlertController(title: "Info", message: "Message sent!!", preferredStyle: .alert)
            messageSentAlert.addAction(UIAlertAction(title: "Ok", style: .default) { _ in })
            self.present(messageSentAlert, animated: true)
        }
    }
}
