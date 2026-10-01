$directory = "c:\Users\ss pc\Desktop\SITE_PRONTO_CLOUDFLAREQQ"
$replacements = @(
    @("alinesouzademoraes4@gmail\.com", "erico.construcao@gmail.com"),
    @("\(\s*65\s*\)\s*99257-3028", "(11) 99188-9884"),
    @("65992573028", "11991889884"),
    @("5565992573028", "5511991889884"),
    @("C&aacute;ceres - MT", "Francisco Morato - SP"),
    @("C&aacute;ceres", "Francisco Morato"),
    @("Cáceres - MT", "Francisco Morato - SP"),
    @("Cáceres", "Francisco Morato"),
    @("Cǭceres", "Francisco Morato"),
    @("MT", "SP"),
    @("Rua Das Opalas, 55", "Rua Adail Jarbas Duclos, 135"),
    @("78\.201-166", "07913-100"),
    @("78210-351", "07913-100"),
    @("68\.379\.081/0001-16", "68.397.990/0001-87"),
    @("68379081000116", "68397990000187"),
    @("68\.379\.081 Aline Souza de Moraes", "68.397.990 Lucas Nascimento de Oliveira"),
    @("Aline Souza de Moraes", "Lucas Nascimento de Oliveira"),
    @("Transporte Rodoviário de Mudanças", "Obras de alvenaria"),
    @("Transporte Rodovi&aacute;rio de Mudan&ccedil;as", "Obras de alvenaria"),
    @("49\.30-2-04", "43.99-1-03"),
    @("Aline Mudan&ccedil;as", "Lucas Constru&ccedil;&otilde;es"),
    @("ALINE MUDAN&Ccedil;AS", "LUCAS CONSTRU&Ccedil;&Otilde;ES"),
    @("Aline Mudanças", "Lucas Construções"),
    @("ALINE", "LUCAS"),
    @("MUDAN&Ccedil;AS", "CONSTRU&Ccedil;&Otilde;ES"),
    @("Mudan&ccedil;as", "Constru&ccedil;&otilde;es"),
    @("mudanças", "construções"),
    @("Mudan&ccedil;a", "Constru&ccedil;&atilde;o"),
    @("fretes e mudancas", "obras e reformas"),
    @("transporte de mudancas", "obras de alvenaria"),
    @("Transportes", "Construções")
)

Get-ChildItem -Path $directory -Filter *.html | ForEach-Object {
    $content = Get-Content $_.FullName -Raw
    foreach ($pair in $replacements) {
        $content = [regex]::Replace($content, $pair[0], $pair[1], "IgnoreCase")
    }
    Set-Content -Path $_.FullName -Value $content -Encoding UTF8
}
