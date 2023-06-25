# 使用方法
1. 将脚本放到任意需要添加到系统Path环境变量中的路径下
2. 右键 "当前路径添加到Path.bat"
3. 选择以管理员权限运行，等待运行结束即可

   结果如:
   ```
   add 'C:\Users\savet\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\CmdUtils' to Path

   成功: 指定的值已得到保存。
   ----------
   end
   ----------
   ```


# 所需运行环境
无

# 注意
1. 如果系统环境变量Path中，已经包含该路径，则不会添加

   结果如:
   ```
   already added 'C:\Users\savet\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\CmdUtils' in Path
   ----------
   end
   ----------
   ```

2.  Windows的环境变量是不区别大小写的，即Path、PATH、path是同一个环境变量