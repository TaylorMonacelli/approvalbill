@'
<?xml version="1.0" encoding="utf-8"?>
<LayoutModificationTemplate
    xmlns="http://schemas.microsoft.com/Start/2014/LayoutModification"
    xmlns:defaultlayout="http://schemas.microsoft.com/Start/2014/FullDefaultLayout"
    xmlns:start="http://schemas.microsoft.com/Start/2014/StartLayout"
    xmlns:taskbar="http://schemas.microsoft.com/Start/2014/TaskbarLayout"
    Version="1">
  <CustomTaskbarLayoutCollection PinListPlacement="Replace">
    <defaultlayout:TaskbarLayout>
      <taskbar:TaskbarPinList>
        <taskbar:DesktopApp DesktopApplicationLinkPath="C:\Program Files\Microsoft VS Code\code.exe" />
        <taskbar:DesktopApp DesktopApplicationLinkPath="C:\Program Files\PowerShell\7\pwsh.exe" />
        <taskbar:DesktopApp DesktopApplicationLinkPath="C:\Windows\System32\control.exe" />
        <taskbar:DesktopApp DesktopApplicationLinkPath="C:\Windows\System32\windowspowershell\v1.0\powershell.lnk" />
        <taskbar:DesktopApp DesktopApplicationLinkPath="%appdata%\Microsoft\Windows\Start Menu\Programs\System Tools\Command Prompt.lnk" />
        <taskbar:DesktopApp DesktopApplicationLinkPath="%ALLUSERSPROFILE%\Microsoft\Windows\Start Menu\Programs\Google Chrome.lnk" />
        <taskbar:DesktopApp DesktopApplicationLinkPath="C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Wireshark.lnk" />
        <taskbar:DesktopApp DesktopApplicationLinkPath="C:\Windows\explorer.exe" />
      </taskbar:TaskbarPinList>
    </defaultlayout:TaskbarLayout>
  </CustomTaskbarLayoutCollection>
</LayoutModificationTemplate>
'@ | Out-File -encoding ASCII C:\Windows\Temp\Taskbar.xml

Import-StartLayout -LayoutPath C:\Windows\Temp\Taskbar.xml -MountPath c:\

# HKCU:\Software\... doesn't exist when we're running under SYSTEM account
New-Item -Force -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced
Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name "TaskbarSmallIcons" -Type DWord -Value 1
Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer -Name "EnableAutoTray" -Type DWord -Value 0
