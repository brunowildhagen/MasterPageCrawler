$result = @{}
Get-ChildItem -Recurse -Path ".\*.aspx" | ForEach-Object {
    $File = $_
    $Content = Get-Content -Raw $File.FullName
    $match = [regex]::match($Content,'MasterPageFile="(.*?)\"').Groups[1].Value
    $result[$match] += @($File.FullName + "`n")
}

foreach($MasterPage in $result.Keys){
    $Paginas = $result[$MasterPage]
    Write-Host "${MasterPage}:"$Paginas.Length"page(s)"
    Write-Host $Paginas 
}