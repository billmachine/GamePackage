//
//  FetchGamesbyPageUseCase.swift
//  OfflineAppTest
//
//  Created by Ahmad Billi Afandi on 26/01/21.
//  Copyright © 2021 nostratech. All rights reserved.
//

import RxSwift
import Foundation

public protocol FetchGamesbyPageUseCase {
     func execute(requestValue: FetchGamesbyPageUseCaseRequestValue) -> Observable<[GameDomain]>
}

public struct FetchGamesbyPageUseCaseRequestValue {
    public let page: Int
    public init(page:Int){
        self.page = page
    }
}

public  class DefaultFetchGamesbyPageUseCase {
    private let gameRepository: GameRepository
    
    public init(gameRepository: GameRepository) {
        self.gameRepository = gameRepository
    }
}

extension DefaultFetchGamesbyPageUseCase:FetchGamesbyPageUseCase {
    public func execute(requestValue: FetchGamesbyPageUseCaseRequestValue) -> Observable<[GameDomain]> {
        gameRepository.getbyPage(page: requestValue.page)
    }
    
}
