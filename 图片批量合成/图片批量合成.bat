@echo off
setlocal enabledelayedexpansion

@rem 设置输出文件夹
set output_folder=output

@rem 检测运行环境
where magick >nul 2>nul
if %errorlevel% neq 0 (
  echo The running environment is not supported 
  echo plz to 'https://imagemagick.org/script/download.php#windows' download and install
  pause
  exit
)

@rem 创建输出文件夹
if not exist !output_folder! (
   md !output_folder!
)

@rem 获取当前目录下所有的文件夹，但排除输出文件夹
set i=0
for /d %%a in (*) do (
    if not "%%a"=="!output_folder!" (
        set /a i+=1
        set "input_dirs[!i!]=%%a"
    )
)

@rem 检查是否存在第二个文件夹
if not exist !input_dirs[2]! (
   echo not has second folder
   pause
   exit
)

@rem 获取图片
set i=0
for %%j in (!input_dirs[1]!\*.png !input_dirs[1]!\*.jpg) do (
    set /a i+=1
    set "img_1[!i!]=%%j"
)

@rem 获取图片和最大合成数量
set i=0
set /a max_mixed_num=0
for %%j in (!input_dirs[2]!\*.png !input_dirs[2]!\*.jpg) do (
    set /a i+=1
	set /a max_mixed_num+=1
    set "img_2[!i!]=%%j"
)

@rem 遍历数组并输出每一个元素
for /l %%i in (1, 1, %max_mixed_num%) do (
	if exist "!img_1[%%i]!" (
		if exist "!img_2[%%i]!" (
			echo form !img_1[%%i]! !img_2[%%i]! to !output_folder!\%%i.png
			magick montage "!img_1[%%i]!" "!img_2[%%i]!" -tile 2x1 -geometry +0+0  "!output_folder!\%%i.png"
		)
    )
)


@rem 结束
@echo --------------
@echo    the end
@echo --------------
pause