//
//  DataService.swift
//  RecipeListApp
//
//  Created by Don wijesinghe on 3/22/22.
//

import Foundation

class DataService{
    
    //parse local json file
    func getLocalData()->[Recipe]{
        
        //get a url path to the file
        let pathString = Bundle.main.path(forResource: "recipes2", ofType: "json")
        
        
        guard pathString != nil else {
            return [Recipe]()
        }
        
        //create a url object
        
        let url = URL(fileURLWithPath: pathString!)
        
        //create a data object
        do{
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            do{
                //Decode the data with a JSON decoder
                let recipeData = try decoder.decode([Recipe].self, from: data)
                //Add the unique IDS
                for r in recipeData{
                    r.id = UUID()
                    
                    for i in r.ingredients{
                        i.id=UUID()
                    }
                }
                //Return the Recipes
                return recipeData
            }
            catch{
                //error with parsing JSON
                print(error)
            }
            
        }
        catch{
            print(error)
        }
        
        
        
       
        
        
        
        
        
        return [Recipe]()
    }
}
