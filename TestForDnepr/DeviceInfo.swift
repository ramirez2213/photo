//
//  DeviceInfo.swift
//  TestForDnepr
//
//  Created by Konstantin Chukhas on 05.11.2019.
//  Copyright © 2019 Konstantin Chukhas. All rights reserved.
//

import Foundation
import UIKit
struct DeviceInfo {
    struct Orientation {
        static var isLandscape: Bool {
            return UIApplication.shared.windows
                .first?
                .windowScene?
                .interfaceOrientation
                .isLandscape ?? false
        }
        static var isPortrait: Bool {
            return UIApplication.shared.windows
                .first?
                .windowScene?
                .interfaceOrientation
                .isPortrait ?? false
        }
    }
}
