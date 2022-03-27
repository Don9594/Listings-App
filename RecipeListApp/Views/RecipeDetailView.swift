//
//  RecipeDetailView.swift
//  RecipeListApp
//
//  Created by Don wijesinghe on 3/24/22.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipeDetail:Recipe
    var body: some View {
        ScrollView{
            
            VStack{
                //MARK: Recipe Image
                Image(recipeDetail.image).resizable().scaledToFit()
                
                //MARK: Recipe name
//                Text(recipeDetail.name)
//                    .font(.title3)
//                    .fontWeight(.light).padding()
//
                
                //MARK: Ingredients
                VStack(alignment: .leading) {
                    Text("Ingredients").font(.headline).padding(.bottom,1)
                    
                    ForEach(recipeDetail.ingredients, id:\.self){ spices in
                        Text("•"+spices)
                            .fontWeight(.light)
                        
                    }
                }
                
                //MARK: Divider
                Divider()
                
                //MARK: Directions
                VStack(alignment: .leading) {
                    Text("Directions")
                        .padding(.bottom,1)
                    ForEach(0..<recipeDetail.directions.count, id:\.self){ index in
                        Text(String(index+1)+". " + recipeDetail.directions[index])
                            .fontWeight(.thin)
                            .padding(.bottom,1)                    }
                }
                .padding(.top)
            }
        }.navigationBarTitle(Text(recipeDetail.name))
        
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        //creat a dummy recipe nd pass it in to the detail view so we can see a preview
        let model=RecipeModel()
        RecipeDetailView(recipeDetail: model.recipes[0])
    }
}
