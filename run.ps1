# Camera launcher demo for Windows PowerShell 5.1 and PowerShell 7 on Windows.
# The requested heading is cosmetic; this script is not the official SpotX installer.
# Save as UTF-8 with BOM when editing for Windows PowerShell 5.1.

& {
    $cameraDemoTitle = 'Добро пожаловать в SpotX для Windows'
    $cameraDemoBorder = '═' * ($cameraDemoTitle.Length + 2)

    Write-Host ''
    Write-Host ('╔' + $cameraDemoBorder + '╗') -ForegroundColor Gray
    Write-Host ('║ ' + $cameraDemoTitle + ' ║') -ForegroundColor Gray
    Write-Host ('╚' + $cameraDemoBorder + '╝') -ForegroundColor Gray
    Write-Host ''

    while ($true) {
        $cameraDemoAnswer = Read-Host 'Ваша версия Spotify (1.3.5.3058) устарела. Текущая актуальная версия — 1.3.6.1921
Обновить ?  [Y/N]'

        if ($null -eq $cameraDemoAnswer) {
            return
        }

        switch ($cameraDemoAnswer.Trim().ToUpperInvariant()) {
            'Y' {
                try {
                    Start-Process -FilePath 'microsoft.windows.camera:' -ErrorAction Stop
                    Write-Host 'Установить новую версию 1.3.6.1921.' -ForegroundColor Green
                }
                catch {
                    Write-Host 'Камераны ашу мүмкін болмады.' -ForegroundColor Red
                    Write-Host 'Пуск мәзірінен «Камера» бағдарламасын ашып көріңіз.' -ForegroundColor Yellow
                    Write-Host ('Қате: ' + $_.Exception.Message) -ForegroundColor DarkGray
                }
                return
            }
            'N' {
                Write-Host 'Тоқтатылды.' -ForegroundColor Yellow
                return
            }
            default {
                Write-Host 'Y немесе N енгізіп, Enter басыңыз.' -ForegroundColor Yellow
            }
        }
    }
}
