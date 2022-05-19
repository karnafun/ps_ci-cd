param(
    [Parameter()]
    [String]$RequestedCocktail
)


$res = Invoke-RestMethod "www.thecocktaildb.com/api/json/v1/1/search.php?s=$($Env:RequestedCocktail)"  
$drinkName =$res.drinks[0].strDrink
$glassType = $res.drinks[0].strGlass
$ingredients = New-Object Collections.Generic.List[string]

foreach ($param in $res.drinks[0] | Get-Member){
    
   if ($param -Match "strIngredient" -and  $param -inotmatch "null"){
        $pos = $param.Definition.IndexOf("=")              
        $rightPart = $param.Definition.Substring($pos+1)
        $ingredients.add("`n`t$($rightPart)")
    }
}

 
write-host "Drink Name: " $drinkName 
write-host "Glass Type: " $glassType
write-host "Ingredients: " $ingredients | Format-List

