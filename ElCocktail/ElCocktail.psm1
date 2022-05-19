Class Cocktail{
    [string]$name
    [string]$glassType
    [string[]]$ingredients

    Cocktail([string]$cName){
        $data = Invoke-RestMethod "www.thecocktaildb.com/api/json/v1/1/search.php?s=$($cName)"  
        $this.name =$data.drinks[0].strDrink
        $this.glassType = $data.drinks[0].strGlass

        # foreach ($param in $res.drinks[0] | Get-Member){
            
        # if ($param -Match "strIngredient" -and  $param -inotmatch "null"){
        #         $pos = $param.Definition.IndexOf("=")              
        #         $rightPart = $param.Definition.Substring($pos+1)
        #         $ingredients.add("`n`t$($rightPart)")
        #     }
        # }
    }
}

function GetCocktail([string]$name){
    return [Cocktail]::new($name)

}
Export-ModuleMember -Function GetCocktail




#  $res = Invoke-RestMethod "www.thecocktaildb.com/api/json/v1/1/search.php?s=$($Env:MyVariable)"  
#  write-host $res | Convert-ToJson
# $drinkName =$res.drinks[0].strDrink
# $glassType = $res.drinks[0].strGlass
# $ingredients = New-Object Collections.Generic.List[string]

# foreach ($param in $res.drinks[0] | Get-Member){
    
#    if ($param -Match "strIngredient" -and  $param -inotmatch "null"){
#         $pos = $param.Definition.IndexOf("=")              
#         $rightPart = $param.Definition.Substring($pos+1)
#         $ingredients.add("`n`t$($rightPart)")
#     }
# }
