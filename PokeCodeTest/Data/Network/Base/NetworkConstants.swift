//
//  NetworkConstants.swift
//  O-Results
//
//  Created by Amador Navarro on 11/03/2018.
//  Copyright © 2018 AmadorNavarro. All rights reserved.
//

import Foundation

public class APINetworkError: Error {
    
    var code: Int = 0
    var title: String = ""
    var message: String = ""
    var raw: String = ""
    
    public static func unknown() -> APINetworkError {
        return APINetworkError(code: 0, message: "OResults_error_message_unexcepted_error_message".localized, raw: ErrorMessageCode.error.messageText)
    }
    
    init(code: Int = 0, message: String, raw: String) {
        self.code = code
        self.message = message
        self.raw = raw
    }
    
    public func error() -> NSError {
        return NSError(domain: message, code: code, userInfo: [NSLocalizedDescriptionKey: raw])
    }
    
}

enum ErrorCode: Int { case error = 404, invalidToken = 401, internalServer = 500, badRequest = 400 }

enum ErrorMessageCode: String {
    
    var messageText: String {
        return self.rawValue
    }
    
    case error = "error"
    
}

enum API {
    
    static let baseURL                          = "http://liveresultat.orientering.se/api.php?"
    static let pathGetCompetitions              = "method=getcompetitions"
    static let pathGetCompetitionInfo           = "method=getcompetitioninfo&comp=%@"
    static let pathGetLastPassings              = "method=getlastpassings&comp=%@"
    static let pathGetClasses                   = "method=getclasses&comp=%@"
    static let pathGetClassResults              = "method=getclassresults&comp=%@&class=%@"
    static let pathGetClubResults               = "method=getclubresults&comp=%@&club=%@"
    static let pathComponentLastHash            = "&lastHash=%@"
    static let pathComponentUnformattedTimes    = "&unformattedTimes=false"
    
//    static func pathGetLastPassings(forCompetition id: Int) -> String {
//        return String(format: API.pathGetLastPassings, String(id)).appending(API.appendLastHash())
//    }
//
//    static func pathGetClasses(forCompetition id: Int) -> String {
//        return String(format: API.pathGetClasses, String(id)).appending(API.appendLastHash())
//    }
//
//    static func pathGetClassResults(forCompetition id: Int, category: String) -> String {
//        let categoryURLFriendly = category.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
//        return String(format: API.pathGetClassResults, arguments: [String(id), categoryURLFriendly]).appending(API.pathComponentUnformattedTimes)
//    }
//
//    static func pathGetClubResults(forCompetition id: Int, club: String) -> String {
//        let clubURLFriendly = club.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
//        return String(format: API.pathGetClubResults, arguments: [String(id), clubURLFriendly]).appending(API.pathComponentUnformattedTimes)
//    }
//
//    static func appendLastHash() -> String {
//        return !SessionDataManager.shared.lastHash.isEmpty ? String(format: API.pathComponentLastHash, SessionDataManager.shared.lastHash) : ""
//    }
    
}
