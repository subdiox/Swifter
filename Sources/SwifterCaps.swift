//
//  SwifterCaps.swift
//  Swifter
//
//  Created by subdiox on 2017/11/20.
//  Copyright © 2017年 Matt Donnelly. All rights reserved.
//

import Foundation

public extension Swifter {
    
    /**
     POST    cards/create
    
     Create vote (caps) and tweet it.
     
     (Private API)
     */
    public func postCaps(cards: [String], durationMinutes: Int = 1440, success: JSONSuccessHandler? = nil, failure: FailureHandler? = nil) {
        let path: String = "cards/create.json"
        
        var parameters = Dictionary<String, Dictionary<String, Any>>()
        var cardData = Dictionary<String, Any>()
        cardData["twitter:api:api:endpoint"] = "1"
        cardData["twitter:long:duration_minutes"] = durationMinutes
        cardData["twitter:card"] = "poll\(cards.count)choice_text_only"
        for (index, string) in cards.enumerated() {
            cardData["twitter:string:choice\(index + 1)_label"] = string
        }
        parameters["card_data"] = cardData
        
        self.jsonRequest(path: path, baseURL: .caps, method: .POST, parameters: parameters, success: success, failure: failure)
    }
    
}
