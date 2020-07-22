//
//  MessagesCoordinator.swift
//  PayBank
//
//  Created by Anna Pomazanova on 7/22/20.
//  Copyright © 2020 NIX Solutions. All rights reserved.
//

import Foundation
import SwiftMessages

// MARK: - MessagesCoordinator
final class MessagesCoordinator {
    
    static func showOverNavigationBar(success: String, duration: Double? = nil) {
        show(title: nil,
             body: success,
             iconImage: nil,
             bgColor: UIColor.orange,
             duration: nil,
             presentationContext: .window(windowLevel: UIWindow.Level(rawValue: UIWindow.Level.normal.rawValue)),
             presentStyle: .top)
    }
    
    static func showOverNavigationBar(error: String, duration: Double? = nil) {
        show(title: .localized(.errorMessageTitle),
             body: error,
             iconImage: nil,
             bgColor: UIColor.red,
             duration: nil,
             presentationContext: .window(windowLevel: UIWindow.Level(rawValue: UIWindow.Level.normal.rawValue)),
             presentStyle: .top)
    }
}

// MARK: - Private
private extension MessagesCoordinator {
    
    static func show(title: String?,
                     body: String,
                     iconImage: UIImage?,
                     bgColor: UIColor,
                     duration: Double?,
                     viewId: String? = nil,
                     presentationContext: SwiftMessages.PresentationContext? = .automatic,
                     presentStyle: SwiftMessages.PresentationStyle? = .top) {
        let view = MessageView.viewFromNib(layout: .cardView)
        
        view.configureTheme(backgroundColor: bgColor, foregroundColor: .white)
        view.configureContent(title: title,
                              body: body,
                              iconImage: iconImage,
                              iconText: nil,
                              buttonImage: nil,
                              buttonTitle: nil,
                              buttonTapHandler: nil)
        
        view.button?.isHidden = true
        
        var config = SwiftMessages.defaultConfig
        
        if let presentationContext = presentationContext {
            config.presentationContext = presentationContext
        }
        
        if let presentStyle = presentStyle {
            config.presentationStyle = presentStyle
        }
        
        if let duration = duration {
            config.duration = .seconds(seconds:duration)
        }
        
        if let id = viewId {
            view.id = id
        }
        
        SwiftMessages.show(config: config, view: view)
    }
    
    static func hide() {
        SwiftMessages.hide()
    }
    
    static func hideAll() {
        SwiftMessages.hideAll()
    }
}
