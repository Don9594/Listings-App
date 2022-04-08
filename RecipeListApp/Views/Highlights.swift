//
//  Highlights.swift
//  RecipeListApp
//
//  Created by Don wijesinghe on 4/7/22.
//

import SwiftUI

struct Highlights: View {
    var highlightss = ""
    init(highlights:[String]){
        for index in 0..<highlights.count{
            if index == highlights.count-1 {
                highlightss += highlights[index]
            }
            else{
                highlightss += highlights[index] + ", "
            }
        }
        
    }
    var body: some View {
        Text(highlightss)
    }
}

struct Highlights_Previews: PreviewProvider {
    static var previews: some View {
        Highlights(highlights: ["ge","er"])
    }
}
