//
//  FavoriteDataSource.swift
//  OfflineAppTest
//
//  Created by Ahmad Billi Afandi on 10/12/20.
//  Copyright © 2020 nostratech. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire
import CoreOfflineAppTestKit

public class DefaultRemoteGameSource: NSObject {
    
    public override init() { }
    
    static let sharedInstance: RemoteGameSource =  DefaultRemoteGameSource()
    
}

extension DefaultRemoteGameSource: RemoteGameSource {
    
    public func getGamebyId(id: String) -> Observable<GameResponse> {
        return Observable<GameResponse>.create { observer in
            if let url = URL(string: "\(ApiUrl.baseUrl)games/\(id)") {
                AF.request(url) { urlRequest in urlRequest.timeoutInterval = 10 }
                    .validate()
                    .responseDecodable(of: GameResponse.self) { response in
                        switch response.result {
                        case .success(let response):
                            observer.onNext(response)
                            observer.onCompleted()
                        case .failure(let error):
                            print(error.localizedDescription)
                            observer.onError(APIError.invalidResponse)
                        }
                    }
            }
            return Disposables.create()
        }
    }
    
    public func getGames() -> Observable<[GameResponse]> {
        return Observable<[GameResponse]>.create { observer in
            if let url = URL(string: "\(ApiUrl.baseUrl)games") {
                AF.request(url)
                    .validate()
                    .responseDecodable(of: ApiResponse<[GameResponse]>.self) { response in
                        switch response.result {
                        case .success(let value):
                            observer.onNext(value.results ?? [])
                            observer.onCompleted()
                        case .failure:
                            observer.onError(APIError.invalidResponse)
                        }
                    }
            }
            return Disposables.create()
        }
    }
    
    public func loadMoreGames(page: Int) -> Observable<[GameResponse]> {
        return Observable<[GameResponse]>.create { observer in
            let parameters: Parameters = [
                "page": "\(page)"
            ]
            if let url = URL(string: "\(ApiUrl.baseUrl)games") {
                AF.request(url
                           ,parameters: parameters)
                    .validate()
                    .responseDecodable(of: ApiResponse<[GameResponse]>.self) { response in
                        switch response.result {
                        case .success(let value):
                            observer.onNext(value.results ?? [])
                            observer.onCompleted()
                        case .failure:
                            observer.onError(APIError.invalidResponse)
                        }
                    }
            }
            return Disposables.create()
        }
    }
    
    public func searchGames(from keyword: String) -> Observable<[GameResponse]> {
        return Observable<[GameResponse]>.create { observer in
            let parameters: Parameters = [
                "search": "\(keyword)"
            ]
            if let url = URL(string: "\(ApiUrl.baseUrl)games") {
                AF.request(url
                           ,parameters: parameters)
                    .validate()
                    .responseDecodable(of: ApiResponse<[GameResponse]>.self) { response in
                        switch response.result {
                        case .success(let value):
                            observer.onNext(value.results ?? [])
                            observer.onCompleted()
                        case .failure:
                            observer.onError(APIError.invalidResponse)
                        }
                    }
            }
            return Disposables.create()
        }
    }
    
    public func getScreenShotsbyId(id: String) -> Observable<[ScreenshotResponse]> {
        return Observable<[ScreenshotResponse]>.create { observer in
            if let url = URL(string: "\(ApiUrl.baseUrl)games/\(id)/screenshots") {
                AF.request(url)
                    .validate()
                    .responseDecodable(of: ApiResponse<[ScreenshotResponse]>.self) { response in
                        switch response.result {
                        case .success(let value):
                            observer.onNext(value.results ?? [])
                            observer.onCompleted()
                        case .failure:
                            observer.onError(APIError.invalidResponse)
                        }
                    }
            }
            return Disposables.create()
        }
    }
    
}
