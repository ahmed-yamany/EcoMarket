//
//  NotificationModel.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 14/02/2024.
//

import UIKit

struct NotificationModel {
    let image: String
    let name: String
    let message: String
    let date: Date?
}

extension NotificationModel {
    static let mockData: [NotificationModel] = [
        .init(image: "icon/usericon", name: "Kristine Jones", 
              message: "It is a long established fact that a reader will be distracted by the readable content of a page",
              date: Date()),
        .init(image: "icon/usericon3", name: "Kay Hicks", 
              message: "There are many variations of passages of Lorem Ipsum available",
              date: Date()),
        .init(image: "icon/usericon2", name: "Cheryl Moretti",
              message: "It is a long established fact that a reader will be distracted by the readable content of a page",
              date: Date()),
        .init(image: "icon/usericon3", name: "Kristine Jones", 
              message: "It is a long established fact that a reader will be distracted by the readable content of a page",
              date: Date()),
        .init(image: "icon/usericon2", name: "Kay Hicks",
              message: "It is a long established fact that a reader will be distracted by the readable content of a page",
              date: Date()),
        .init(image: "icon/usericon3", name: "Kristine Jones", 
              message: "It is a long established fact that a reader will be distracted by the readable content of a page",
              date: Date()),
        .init(image: "icon/usericon2", name: "Cheryl Moretti",
              message: "It is a long established fact that a reader will be distracted by the readable content of a page",
              date: Date()),
        .init(image: "icon/usericon3", name: "Kay Hicks",
              message: "There are many variations of passages of Lorem Ipsum available",
              date: Date())
    ]
}
