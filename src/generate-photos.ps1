# generate-photos.ps1
$photos = Get-ChildItem -Path "./Photos" -File | Where-Object { $_.Extension -match '\.(jpg|jpeg|png|gif|webp)$' }

$result = @()

foreach ($photo in $photos) {
    $item = [PSCustomObject]@{
        path        = "Photos/$($photo.Name)"
        description = "Foto"
    }
    $result += $item
}

$result | ConvertTo-Json -Depth 2 | Set-Content -Encoding UTF8 -Path "photos.json"

Write-Host "✅ photos.json generado correctamente."
