//
//  ScreenshotEntity.swift
//  OfflineAppTest
//
//  Created by Ahmad Billi Afandi on 10/12/20.
//  Copyright © 2020 nostratech. All rights reserved.
//

import Foundation
import RealmSwift

public final class ScreenshotEntity: Object {
    @objc public dynamic var image: String?
 
}

 extension ScreenshotEntity {
    public func toDomain() -> ScreenshotDomain {
        return ScreenshotDomain(image: URL(string:image ?? ""))
    }
}
