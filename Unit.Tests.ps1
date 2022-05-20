Import-Module -Force './ElCocktail/ElCocktail.psm1'
Get-command -Module ElCocktail
Import-Module Pester -PassThru

Describe 'Verify Cocktail Name' {
    It 'Given a valid cocktail name, should return the same name' {
        $name = "Mojito"
        $cocktail = GetCocktail($name )
        $cocktail.name | Should -Be $name 
    }
}

Describe 'Check Glass Type' {
    It 'Mojito glass type is Highball glass' {        
        $cocktail = GetCocktail("Mojito")
        $cocktail.glassType | Should -Be "Highball glass"
    }

    It 'Margarita glass type should be  Cocktail glass'{
        $cocktail = GetCocktail("Margarita")
        $cocktail.glassType | Should -Be "Cocktail glass"
    }

    It 'First ingredient in margarita is Tequila' {
        $cocktail = GetCocktail("Margarita")
        $cocktail.ingredients[0].name | Should -Be "Tequila"
    }
}
 