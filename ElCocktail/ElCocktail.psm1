Class Cocktail{
    [string]$name
    [string]$glassType
    [string[]]$ingredients

    Cocktail([string]$cName){
        $data = Invoke-RestMethod "www.thecocktaildb.com/api/json/v1/1/search.php?s=$($cName)"  
        $this.name =$data.drinks[0].strDrink
        $this.glassType = $data.drinks[0].strGlass

    }
}
function GetCocktail([string]$name){
    return [Cocktail]::new($name)

}
Export-ModuleMember -Function GetCocktail
