//
//  ScreenshotDomain.swift
//  OfflineAppTest
//
//  Created by Ahmad Billi Afandi on 10/12/20.
//  Copyright © 2020 nostratech. All rights reserved.
//

import Foundation

public struct ScreenshotDomain {
    public var image: URL?
}

extension ScreenshotDomain {
    public func toEntity() -> ScreenshotEntity {
        let ss = ScreenshotEntity()
        ss.image = self.image?.absoluteString
        return ss
    }
}
