@echo off


@echo start...

@rem 切换回Win10样式
reg.exe add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve

@rem 重启文件管理器
@taskkill /f /im explorer.exe
start explorer.exe

@echo ----------
@echo   end 
@echo ----------

pause