@echo off

@rem 获取当前所在路径
set "current_path=%~dp0"

@rem 保存的路径
set "save_path=%current_path%\MobaXterm-Keygen.py"

@rem 保存版本号的文件
set "version_file=%current_path%\version.dat"

@rem 检测运行环境
where python >nul 2>nul
if %errorlevel% neq 0 (
    echo The running environment is not supported 
    echo plz to 'https://www.python.org/downloads/' download and install python3
    pause
    exit
)

@rem 确认版本号文件是否存在
if not exist "%version_file%" (
    echo "check fail : not find %version_file%"
    echo "plz put %0 in MobaXterm's install directory"
    pause
    exit
)

@rem 读取版本号
set /p version=< "%version_file%"

@rem 检查是否读取到版本号
if "%version%" == "" (
    echo "check fail : not get version number"
    echo "plz put %0 in MobaXterm's install directory"
    pause
    exit
)
echo "get MobaXterm version number is %version%"

@rem 检查是否下载完成
if not exist "%save_path%" (
    bitsadmin /transfer "download_task" /download /priority normal "https://raw.githubusercontent.com/flygon2018/MobaXterm-keygen/master/MobaXterm-Keygen.py" "%save_path%"
)

python MobaXterm-Keygen.py user %version%

pause