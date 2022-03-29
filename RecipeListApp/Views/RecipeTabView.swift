//
//  RecipeTabView.swift
//  RecipeListApp
//
//  Created by Don wijesinghe on 3/27/22.
//

import SwiftUI

struct RecipeTabView: View {
    var body: some View {
        
        TabView{
            
            Text("Featured Items").tabItem{
                VStack{
                    Image(systemName: "star.fill")
                    Text("Featured")
                }
            }
            
            RecipeListView().tabItem{
                VStack{
                    Image(systemName: "list.bullet.rectangle")
                    Text("List")
                }
            }
            
        }.environmentObject(RecipeModel())
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
