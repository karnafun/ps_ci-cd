Class Cocktail{
    [string]$name
    [string]$glassType
    [string[]]$ingredients

    Cocktail([string]$cName){
        $data = Invoke-RestMethod "www.thecocktaildb.com/api/json/v1/1/search.php?s=$($cName)"  
        $this.name =$data.drinks[0].strDrink
        $this.glassType = $data.drinks[0].strGlass
        foreach ($param in $data.drinks[0] | Get-Member){
            
        if ($param -Match "strIngredient" -and  $param -inotmatch "null"){
                $pos = $param.Definition.IndexOf("=")              
                $rightPart = $param.Definition.Substring($pos+1)
                $this.ingredients.add("`n`t$($rightPart)")
            }
        }
    }
}
function GetCocktail([string]$name){
    return [Cocktail]::new($name)

}
Export-ModuleMember -Function GetCocktail
