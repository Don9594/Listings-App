//
//  RecipeFeaturedView.swift
//  RecipeListApp
//
//  Created by Don wijesinghe on 3/29/22.
//

import SwiftUI

struct RecipeFeaturedView: View {
    @EnvironmentObject var model:RecipeModel
    @State var showSheet = false
    @State var tabSelectionIndex = 0
    var body: some View {
        
        VStack(alignment: .leading, spacing:0) {
            Text("Featured Recipes").bold().padding(.leading).font(.largeTitle).padding(.top,10)
            GeometryReader{ geo in
                TabView(selection: $tabSelectionIndex){
                    ForEach(0..<model.recipes.count){ index in
                        if model.recipes[index].featured==true{
                            Button(action: {
                                self.showSheet = true
                            }, label: {
                                ZStack {
                                    Rectangle().foregroundColor(.white)
                                    
                                    VStack(spacing:0){
                                        Image(model.recipes[index].image).resizable().aspectRatio(contentMode: .fill).clipped()
                                        Text(model.recipes[index].name).padding(5)
                                    }
                                }
                            }).tag(index).sheet(isPresented: $showSheet, content: {
                                RecipeDetailView(recipeDetail: model.recipes[index] )
                            })
                            .buttonStyle(PlainButtonStyle()).frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).cornerRadius(15).shadow(color:Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.7),radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/,x:-5,y:10)
                        }
                    }
                }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic)).indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            
            VStack(alignment: .leading, spacing: 0){
                Text("Preparation Time").font(.headline)
                Text(model.recipes[tabSelectionIndex].prepTime)
                    
                Text("Highlights").font(.headline)
                Highlights(highlights: model.recipes[tabSelectionIndex].highlights)

            }.padding([.leading,.bottom])
            
        }
        .onAppear(perform: {setFeaturedIndex()})
        
    }
    func setFeaturedIndex(){
        let index = model.recipes.firstIndex { (recipeee) ->
            Bool in
            return recipeee.featured
        }
        tabSelectionIndex = index ?? 0
    }
    
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView().environmentObject(RecipeModel())
    }
}

//                ForEach(0..<model.recipes[tabSelectionIndex].highlights.count){ indexx in
//                    Text(model.recipes[tabSelectionIndex].highlights[indexx])
//                }
