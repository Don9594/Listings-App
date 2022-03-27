//
//  RecipeModel.swift
//  RecipeListApp
//
//  Created by Don wijesinghe on 3/22/22.
//

import Foundation

class RecipeModel:ObservableObject{
    @Published var recipes = [Recipe]()
    
    init() {
        recipes.self = DataService().getLocalData()
        //if we are using DataService class only for methods, set methods to static and then do this
        //recipes.self = DataService.getLocalData()
        
    }
}
