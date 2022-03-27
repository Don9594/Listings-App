//
//  Recipe.swift
//  RecipeListApp
//
//  Created by Don wijesinghe on 3/22/22.
//

import Foundation

class Recipe:Identifiable,Decodable{
    var id:UUID?
    var name:String
    var featured:Bool
    var image:String
    var description:String
    var prepTime:String
    var cookTime:String
    var totalTime:String
    var servings:Int
    var highlights:[String]
    var ingredients:[Ingredient]
    var directions:[String]
}

//Identifiable: lets us use the class instance in a list
//Decodable: lets us parse it from a json file
class Ingredient:Identifiable,Decodable{
    var id:UUID?
    var name=""
    var numAmt=0
    var denomAmt:Int?
    var unit:String?
}
