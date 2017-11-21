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
    
     Create cards.
     
     (Private API)
     */
    public func createCards(cards: [String], durationMinutes: Int = 1440, success: SuccessHandler? = nil, failure: FailureHandler? = nil) {
        let path: String = "cards/create.json"
        
        var parameters = Dictionary<String, Any>()
        var cardData = Dictionary<String, Any>()
        cardData["twitter:api:api:endpoint"] = "1"
        cardData["twitter:long:duration_minutes"] = durationMinutes
        cardData["twitter:card"] = "poll\(cards.count)choice_text_only"
        for (index, string) in cards.enumerated() {
            cardData["twitter:string:choice\(index + 1)_label"] = string
        }
        parameters["card_data"] = cardData
        
        self.postJSON(path: path, baseURL: .caps, parameters: parameters, success: { json, _ in success?(json) }, failure: failure)
    }
    
    public func postCards(status: String, cardUri: String, success: SuccessHandler? = nil, failure: FailureHandler? = nil) {
        let path: String = "statuses/update.json"
        
        var parameters = Dictionary<String, Any>()
        parameters["auto_populate_reply_metadata"] = true
        parameters["batch_mode"] = "off"
        parameters["card_uri"] = cardUri
        parameters["cards_platform"] = "iPhone-13"
        parameters["contributor_details"] = 1
        parameters["enable_dm_commands"] = false
        parameters["ext"] = "altText,focusRects,info360,mediaColor,mediaRestrictions,mediaStats,stickerInfo"
        parameters["include_cards"] = 1
        parameters["include_carousels"] = 1
        parameters["include_entities"] = 1
        parameters["include_ext_media_color"] = true
        parameters["include_media_features"] = true
        parameters["include_my_retweet"] = 1
        parameters["include_profile_interstitial_type"] = true
        parameters["include_profile_location"] = true
        parameters["include_reply_count"] = 1
        parameters["include_user_entities"] = true
        parameters["include_user_hashtag_entities"] = true
        parameters["include_user_mention_entities"] = true
        parameters["include_user_symbol_entities"] = true
        parameters["status"] = status
        parameters["tweet_mode"] = "extended"

        self.postJSON(path: path, baseURL: .api, parameters: parameters, success: { json, _ in success?(json) }, failure: failure)
    }
    
}
