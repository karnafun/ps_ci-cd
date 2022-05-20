Import-Module -Force './ElCocktail/ElCocktail.psm1'

$cocktail = GetCocktail('Margarita')
write-host $cocktail.ingredients[0].name | ConvertTo-Json
$cocktail.PrintIngredients()