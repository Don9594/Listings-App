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
            
            VStack(alignment: .leading){
                //MARK: Recipe Image
                Image(recipeDetail.image).resizable().scaledToFill()
                
                //MARK: Recipe name
//                Text(recipeDetail.name)
//                    .font(.title3)
//                    .fontWeight(.light).padding()
//
                
                //MARK: Ingredients
                VStack(alignment: .leading) {
                    Text("Ingredients").font(.headline).padding(.bottom,1)
                    
                    ForEach(recipeDetail.ingredients){ i in
                        Text("•"+i.name)
                            .fontWeight(.light)
                        
                    }
                }
                .padding(.leading)
                
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
        }.navigationBarTitle(recipeDetail.name)
        
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        //creat a dummy recipe nd pass it in to the detail view so we can see a preview
        let model=RecipeModel()
        RecipeDetailView(recipeDetail: model.recipes[0])
    }
}
