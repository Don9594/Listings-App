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
    
    static func getPortion(ingredient:Ingredient ,servingSize:Int,targetServing:Int)->String{
        //get single serving size
        var gcf=1
        var larger:Int
        var whole=0
        var remainder:Int
        var portionSize=""
        var num = ingredient.num ?? 1
        var denom = ingredient.denom ?? 1
        //
        
      
        
        if ingredient.num != nil{
            
            denom *= servingSize
            num = num*targetServing
            
            if(num<denom){
                larger = num
            }
            else{
                larger = denom
            }
            for _ in 0...denom{
                if((num%larger == 0)&&(denom%larger == 0)){
                    gcf = larger
                    break
                }
                else{
                    larger-=1
                }
            }
            //divide by common greatest common diviser
            num = num/gcf
            denom = denom/gcf
            
            whole = num/denom
            remainder = num%denom
            
            if(remainder != 0){
                if whole>0{
                    portionSize = "\(whole) \(remainder)/\(denom) "
                }
                else{
                    portionSize = "\(remainder)/\(denom) "
                }
            }
            else{
                portionSize = "\(whole) "
            }
            
            
        }
        if ingredient.unit != nil {
            if (whole + num/denom) > 1 {
                portionSize = portionSize + ingredient.unit! + "s "
            }
            portionSize = portionSize + ingredient.unit! + " "
        }
        return portionSize
    }
}
