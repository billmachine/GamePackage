//
//  Screenshot.swift
//  OfflineAppTest
//
//  Created by Ahmad Billi Afandi on 23/09/20.
//  Copyright © 2020 nostratech. All rights reserved.
//

//#if !os(macOS)
//import UIKit
//#endif
import Foundation
import CoreOfflineAppTestKit

public class ScreenshotResponse: Codable,ReflectedStringConvertible {
    public var image: String?

    enum CodingKeys: String, CodingKey {
        case image
    }
    
    required public init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        image = try container.decode(String?.self, forKey: .image)
        
    }
}

extension ScreenshotResponse {
    public func toDomain() -> ScreenshotDomain {
        let bg_image_domain = URL(string:image ?? "") 
        return ScreenshotDomain(image: bg_image_domain)
    }
}
