$directory = "c:\Users\ss pc\Desktop\SITE_PRONTO_CLOUDFLAREQQ"
$replacements = @(
    @("\+55-65-99257-3028", "+55-11-99188-9884"),
    @("Apt;Anexo;Apt;Apt", ""),
    @("caceres", "francisco morato"),
    @("cuiaba", "sao paulo"),
    @("mato grosso", "sao paulo"),
    @("Lucas Constru&ccedil;&otilde;es & Constru&ccedil;&otilde;es", "Lucas Constru&ccedil;&otilde;es"),
    @("Lucas Construes & Construes", "Lucas Construções"),
    @("mudancas residenciais", "obras residenciais"),
    @("mudanca interestadual", "obras comerciais"),
    @("caminhao de mudanca", "servicos de alvenaria"),
    @("embalagem t&eacute;cnica, desmontagem e montagem de m&oacute;veis, seguro de carga e emiss&atilde;o de nota fiscal", "constru&ccedil;&atilde;o, reforma e alvenaria com emiss&atilde;o de nota fiscal"),
    @("embalagem especializada, equipe cuidadosa, frota com ba&uacute; fechado e seguro de carga", "equipe cuidadosa, constru&ccedil;&atilde;o e reformas"),
    @("desmontagem e montagem de mveis, embalagem protetora e transporte seguro", "construo, reforma e alvenaria em geral"),
    @("@type"": ""MovingCompany""", "@type"": ""LocalBusiness""")
)

Get-ChildItem -Path $directory -Filter *.html | ForEach-Object {
    $content = Get-Content $_.FullName -Raw
    foreach ($pair in $replacements) {
        $content = [regex]::Replace($content, $pair[0], $pair[1], "IgnoreCase")
    }
    Set-Content -Path $_.FullName -Value $content -Encoding UTF8
}
