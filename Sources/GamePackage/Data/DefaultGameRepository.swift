//
//  GameRepository.swift
//  OfflineAppTest
//
//  Created by Ahmad Billi Afandi on 10/12/20.
//  Copyright © 2020 nostratech. All rights reserved.
//

import Foundation 
import RxSwift

public class DefaultGameRepository: NSObject {
    
    fileprivate let remote: RemoteGameSource

    public init(remote: RemoteGameSource) {
      self.remote = remote
    }

}

extension DefaultGameRepository : GameRepository {
    public func getGames() -> Observable<[GameDomain]> {
        self.remote.getGames().map {
            return $0.map {
                return $0.toDomain()
            }
        }
    }
    
    public func getGamebyId(id:String) -> Observable<GameDomain> {
        self.remote.getGamebyId(id: id).map {
            return $0.toDomain()
        }
    }
    
    public func getbyPage(page: Int) -> Observable<[GameDomain]> {
        self.remote.loadMoreGames(page: page).map {
            $0.map {
                $0.toDomain()
            }
        }
    }
    
    public func search(_word keword:String) -> Observable<[GameDomain]> {
        self.remote.searchGames(from: keword).map {
            $0.map {
                $0.toDomain()
            }
        }
    }
    
    public func getScreenShotsbyId(id: String) -> Observable<[ScreenshotDomain]> {
        self.remote.getScreenShotsbyId(id: id).map {
            return $0.map {
                 $0.toDomain()
            }
        }
    }
    
}
