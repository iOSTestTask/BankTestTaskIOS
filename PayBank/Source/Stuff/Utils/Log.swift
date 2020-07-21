//
//  Log.swift
//  PayBank
//
//  Created by Anna Pomazanova on 7/21/20.
//  Copyright © 2020 NIX Solutions. All rights reserved.
//

import UIKit

#if DEBUG
import CocoaDebug
#endif

struct Log {

    enum Tag: String {
        case general = "general"
        case network = "network"
    }

    static func debug(_ message: String, tag: Tag = .general) {
        log(message, tag: tag, color: .white)
    }

    static func info(_ message: String, tag: Tag = .general) {
        log(message, tag: tag, color: .green)
    }

    static func warning(_ message: String, tag: Tag = .general) {
        log(message, tag: tag, color: .yellow)
    }

    static func error(_ message: String, tag: Tag = .general) {
        log(message, tag: tag, color: .red)
    }

    static func log(_ message: String, tag: Tag = .general, color: UIColor) {
        #if DEBUG
        swiftLog(#file, #function, #line, "[" + tag.rawValue + "] " + message, color, false)
        #endif
    }
}

// MARK: - Shake gesture
#if DEBUG
var cocoaDebugIsEnabled = false

extension UIWindow {
    open override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        guard
            motion == .motionShake,
            !cocoaDebugIsEnabled else {
            return
        }

        CocoaDebug.enable()
        cocoaDebugIsEnabled = true
    }
}
#endif
