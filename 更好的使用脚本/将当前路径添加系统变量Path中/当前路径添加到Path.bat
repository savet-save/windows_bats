@echo off
setlocal enabledelayedexpansion

@rem 获取当前所在路径
set "current_path=%~dp0"

REM 删除路径结尾的反斜杠
if "%current_path:~-1%"=="\" set "current_path=%current_path:~0,-1%"

@rem 获取系统Path变量
set path_value=%Path%

@rem 判断是否已经添加
if "!path_value:%current_path%=!"=="%path_value%" (
    @rem 还没有添加
    @echo add '%current_path%' to Path
    setx /m Path "%Path%;%current_path%;"
) else (
    @rem 已经添加
    echo already added '%current_path%' in Path
)


@echo ----------
@echo   end 
@echo ----------

pause