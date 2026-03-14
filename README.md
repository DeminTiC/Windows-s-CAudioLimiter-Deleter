# Windows CAudioLimiter 删除工具

本工具用于移除 Windows 系统中的 **CAudioLimiter** 音频限制器组件。CAudioLimiter 是某些 Realtek 音频驱动或 Windows 音频增强功能中内置的动态范围压缩器/限制器，它可能会在播放时自动降低音量峰值，导致音质损失或动态范围压缩。通过删除该组件，可以恢复音频的原始动态范围，提升高保真听感。

## 背景

许多 Realtek 高清晰音频（HD Audio）驱动会在后台启用 CAudioLimiter（音频限制器），其目的是保护扬声器免受过载损坏，但副作用是压缩了音频的动态范围，使声音听起来“扁平”、缺乏冲击力。对于外接高品质音响或耳机的用户来说，这种限制反而降低了音质。

本脚本通过修改注册表或删除相关文件来彻底禁用 CAudioLimiter，释放音频硬件的全部潜力。

## 功能

- 检测系统中是否启用了 CAudioLimiter
- 一键删除 CAudioLimiter 相关注册表项和/或驱动文件
- 备份原始配置（可选）
- 支持 Windows 7/8/10/11（x86 及 x64）

## 使用方法

1. **以管理员身份运行**脚本（批处理或 PowerShell）。
2. 根据提示选择操作：
   - 1：删除 CAudioLimiter（推荐）
   - 2：还原备份（如果之前备份过）
   - 3：仅检测当前状态
3. 重启计算机使更改生效。

### 示例（批处理）

```batch
CAudioLimiter_Deleter.bat
```

### 示例（PowerShell）

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force
.\CAudioLimiter_Deleter.ps1
```

## 注意事项

- **操作不可逆**：删除后可能无法通过正常方式恢复，建议先创建系统还原点或使用脚本的备份功能。
- **仅限高级用户**：对注册表和系统文件的修改存在风险，请确保理解脚本内容后再执行。
- **驱动更新后可能恢复**：部分音频驱动更新时会重新添加 CAudioLimiter，需要再次运行本工具。
- 如果删除后出现声音异常，可使用备份还原或重新安装声卡驱动。

## 系统要求

- Windows 7 及以上版本（32/64位）
- 安装有 Realtek 或兼容的 HD Audio 驱动
- 管理员权限

## 许可证

[MIT](LICENSE)

## 贡献

欢迎提交 Issue 或 Pull Request 来改进脚本兼容性和功能。

---

**免责声明**：本工具为开源社区提供，作者不对因使用本工具造成的任何系统损坏或数据丢失负责。请自行承担风险。
