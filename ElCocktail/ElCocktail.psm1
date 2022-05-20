Class CocktailIngredient{
    [string]$name
    [string]$amount
    CocktailIngredient([string]$ingName,[string]$ingAmount){
        $this.name = $ingName
        $this.amount = $ingAmount
    }
}

Class Cocktail{
    [string]$name
    [string]$glassType
    [CocktailIngredient[]]$ingredients

    Cocktail([string]$cName){
        $data = Invoke-RestMethod "www.thecocktaildb.com/api/json/v1/1/search.php?s=$($cName)"  
        $this.name =$data.drinks[0].strDrink
        $this.glassType = $data.drinks[0].strGlass
        $ingNames =new-Object Collections.Generic.List[string]
        $ingValues=new-Object Collections.Generic.List[string]
        
        $ing = [CocktailIngredient]::new('water','a lot')
        foreach ($param in $data.drinks[0] | Get-Member){            
            if ($param -Match "strIngredient" -and  $param -inotmatch "null"){
                    $pos = $param.Definition.IndexOf("=")              
                    $rightPart = $param.Definition.Substring($pos+1)
                    $ingNames.add("$($rightPart)")                     
            }elseif ($param -Match "measure" -and  $param -inotmatch "null"){
                $pos = $param.Definition.IndexOf("=")              
                    $rightPart = $param.Definition.Substring($pos+1)
                    $ingValues.add("$($rightPart)")   
            }
        }
    
        for (($i = 0); $i -lt $ingNames.Count; $i++)
            {
                $ingName = $ingNames[$i]
                $ingValue = ''
                if ($i -lt $ingValues.Count){ $ingValue = $ingValues[$i]}
                $this.ingredients+= [CocktailIngredient]::new($ingName,$ingValue)
        }        

        
    }

    [void]PrintIngredients(){
        foreach ($ing in $this.ingredients) {
            if([string]::IsNullOrEmpty($ing.amount)){
                write-host "`n $($ing.name)"
            }else {
                write-host "`n $($ing.name) - $($ing.amount) "
            }
            
        }
    }
}

function GetCocktail([string]$name){
    return [Cocktail]::new($name)
}

Export-ModuleMember -Function GetCocktail
