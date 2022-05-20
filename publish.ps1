param (
    [string] $version,
    [string] $preReleaseTag,
    [string] $apiKey
)

New-ModuleManifest `
    -Path .\ElCocktail\ElCocktail.psd1 `
    -ModuleVersion $version `
    -Author "Dor Danai" `
    -Description "Get Cocktail Information from thecocktaildb.com"


Publish-Module `
    -Path .\ElCocktail `
    -NuGetApiKey $apiKey `
    -Verbose -Force