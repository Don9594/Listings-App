//
//  ContentView.swift
//  RecipeListApp
//
//  Created by Don wijesinghe on 3/22/22.
//

import SwiftUI

struct RecipeListView: View {
    //@ObservedObject var model = RecipeModel()
    @EnvironmentObject var model:RecipeModel
    var body: some View {
        
        NavigationView{
            List(model.recipes){ r in
                NavigationLink(
                    destination: RecipeDetailView(recipeDetail: r),
                    label: {
                        HStack(spacing: 20.0){
                            Image(r.image).resizable().scaledToFill().frame(width: 50, height: 50, alignment: .center).clipped().cornerRadius(5)
                            Text(r.name)
                            
                        }
                    })
                
                
            }.navigationBarTitle("Recipes")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}
