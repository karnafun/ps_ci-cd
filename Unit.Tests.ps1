Import-Module -Force './ElCocktail/ElCocktail.psm1'
Get-command -Module ElCocktail
Import-Module Pester -PassThru

Describe 'Get-Planet' {
    It 'Given no parameters, it lists all 8 planets' {
        $cocktail = GetCocktail("Mojito")
        $cocktail.name | Should -Be "Mojito"
    }
}
