@echo off
setlocal enabledelayedexpansion

:: 显示作者信息
echo ========================================
echo   CAudioLimiter键值删除
echo   作者：TOPiC
echo   版本：0.1
echo   日期：2025/10/2
echo ========================================
echo.

:: 设置日志文件路径
set "logFile=%temp%\registry_cleanup.log"
echo [%date% %time%] 脚本开始执行 > "%logFile%"
echo [%date% %time%] 作者：TOPiC，版本：0.1 >> "%logFile%"

:: 检查管理员权限
echo [%date% %time%] 正在检查管理员权限...
echo [%date% %time%] 正在检查管理员权限... >> "%logFile%"
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo [%date% %time%] 错误：请以管理员身份运行此脚本
    echo [%date% %time%] 错误：请以管理员身份运行此脚本 >> "%logFile%"
    pause
    exit /b 1
)
echo [%date% %time%] 管理员权限确认成功
echo [%date% %time%] 管理员权限确认成功 >> "%logFile%"

set "mainKey=HKEY_CLASSES_ROOT\CLSID\{d69e0717-dd4b-4b25-997a-da813833b8ac}"
set "subKey=%mainKey%\InProcServer32"

:: 获取注册表键所有权
echo [%date% %time%] 正在获取注册表键所有权...
echo [%date% %time%] 正在获取注册表键所有权... >> "%logFile%"
takeown /f "%mainKey%" /a >nul 2>&1
if %errorlevel% equ 0 (
    echo [%date% %time%] 所有权获取成功
    echo [%date% %time%] 所有权获取成功 >> "%logFile%"
) else (
    echo [%date% %time%] 警告：所有权获取可能失败
    echo [%date% %time%] 警告：所有权获取可能失败 >> "%logFile%"
)

:: 设置完全控制权限
echo [%date% %time%] 正在设置完全控制权限...
echo [%date% %time%] 正在设置完全控制权限... >> "%logFile%"
icacls "%mainKey%" /grant administrators:F /t >nul 2>&1
if %errorlevel% equ 0 (
    echo [%date% %time%] 权限设置成功
    echo [%date% %time%] 权限设置成功 >> "%logFile%"
) else (
    echo [%date% %time%] 警告：权限设置可能失败
    echo [%date% %time%] 警告：权限设置可能失败 >> "%logFile%"
)

:: 删除子键
echo [%date% %time%] 正在尝试删除子键...
echo [%date% %time%] 正在尝试删除子键... >> "%logFile%"
reg delete "%subKey%" /f 2>nul
if %errorlevel% equ 0 (
    echo [%date% %time%] 子键删除成功
    echo [%date% %time%] 子键删除成功 >> "%logFile%"
) else (
    echo [%date% %time%] 子键不存在或删除失败
    echo [%date% %time%] 子键不存在或删除失败 >> "%logFile%"
)

:: 删除主键
echo [%date% %time%] 正在尝试删除主键...
echo [%date% %time%] 正在尝试删除主键... >> "%logFile%"
reg delete "%mainKey%" /f 2>nul
if %errorlevel% equ 0 (
    echo [%date% %time%] 主键删除成功
    echo [%date% %time%] 主键删除成功 >> "%logFile%"
) else (
    echo [%date% %time%] 主键不存在或删除失败
    echo [%date% %time%] 主键不存在或删除失败 >> "%logFile%"
)

:: 完成信息
echo.
echo [%date% %time%] 操作完成，日志已保存至：%logFile%
echo [%date% %time%] 操作完成 >> "%logFile%"
echo ========================================
echo   按任意键退出...
echo ========================================
pause >nul
exit
