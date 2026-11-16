$ErrorActionPreference = "Stop"
$port = 8766
$prefix = "http://localhost:$port/"
$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$indexPath = Join-Path $root "index.html"

$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add($prefix)
$listener.Start()

Write-Host "OSC.TUBE SERVER RUNNING AT $prefix" -ForegroundColor Green
Write-Host "Press Ctrl+C or close this window to stop." -ForegroundColor DarkGray

Start-Process $prefix

try {
    while ($listener.IsListening) {
        $context = $listener.GetContext()
        $req = $context.Request
        $res = $context.Response
        try {
            $path = $req.Url.AbsolutePath
            if ($path -eq "/" -or $path -eq "/index.html") {
                $bytes = [System.IO.File]::ReadAllBytes($indexPath)
                $res.ContentType = "text/html; charset=utf-8"
                $res.StatusCode = 200
                $res.ContentLength64 = $bytes.Length
                $res.OutputStream.Write($bytes, 0, $bytes.Length)
            } else {
                $res.StatusCode = 404
            }
        } catch {
            $res.StatusCode = 500
        } finally {
            try { $res.OutputStream.Close() } catch {}
        }
    }
} finally {
    $listener.Stop()
    $listener.Close()
}
