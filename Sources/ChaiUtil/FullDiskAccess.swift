//
//  File.swift
//  ChaiUtil
//
//  Created by changlin on 2024/9/2.
//

import AppKit
import Foundation
import UniformTypeIdentifiers

func openSecurityPreferences() {
    let url = URL(string: "x-apple.systempreferences:com.apple.preference.security?Privacy_AllFiles")!
    NSWorkspace.shared.open(url)
}

enum FullDiskAccess {
    static func promptIfNotGranted(
        title: String,
        message: String,
        settingsButtonTitle: String = "Open Settings",
        icon: NSImage? = nil
    ) {
        guard !isGranted else { return }
        let alert = NSAlert()
        alert.messageText = title
        alert.informativeText = message
        alert.icon = icon ?? alertIcon()

        alert.addButton(withTitle: settingsButtonTitle)

        let response = alert.runModal()

        if case .alertFirstButtonReturn = response {
            openSecurityPreferences()
        }
    }

    static var isGranted: Bool {
        return FileManager.default.isReadableFile(atPath: "/Library/Application Support/com.apple.TCC/TCC.db")
    }

    static var appIsSandBoxed: Bool {
        return ProcessInfo.processInfo.environment["APP_SANDBOX_CONTAINER_ID"] != nil
    }

    private static func alertIcon() -> NSImage? {
        guard let appIconImage = NSApp.applicationIconImage else {
            return NSImage(named: "NSInfo")
        }

        // Draw the app icon with a badge (privacy icon or info icon if unavailable)
        let appIconInset: CGFloat = 4
        let badgeImage: NSImage?
        let badgeSize: CGSize?
        let badgeDrawingScale: CGFloat

        if let privacyPrefPaneType = UTType("com.apple.graphic-icon.privacy") {
            let privacyIcon = NSWorkspace.shared.icon(for: privacyPrefPaneType)
            badgeImage = privacyIcon
            badgeSize = privacyIcon.size
            badgeDrawingScale = 1.8
        } else {
            badgeImage = NSImage(named: "NSInfo")
            badgeSize = nil
            badgeDrawingScale = 0.45
        }

        return NSImage(size: appIconImage.size, flipped: false) { drawRect in
            appIconImage.draw(in: drawRect.insetBy(dx: appIconInset, dy: appIconInset))

            // Draw the badge
            if let badgeImage {
                let size = badgeSize ?? drawRect.size
                let badgeRect = NSRect(
                    x: drawRect.size.width - (size.width * badgeDrawingScale),
                    y: 0,
                    width: size.width * badgeDrawingScale,
                    height: size.height * badgeDrawingScale
                )
                badgeImage.draw(in: badgeRect)
            }

            return true
        }
    }
}
