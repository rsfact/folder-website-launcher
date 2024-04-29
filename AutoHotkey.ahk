#Persistent
#SingleInstance, Force
#NoEnv
#UseHook
#InstallKeybdHook
#InstallMouseHook
#HotkeyInterval, 2000
#MaxHotkeysPerInterval, 200
Process, Priority,, Realtime
SendMode, Input
SetWorkingDir %A_ScriptDir%
SetTitleMatchMode, 2
; SetKeyDelay, , 10

; 変数の初期化
#Include, %A_ScriptDir%\Variables.ahk

; メニューアイコン設定
Menu, Tray, Icon, icon.ico

; プラグインの検出・取り込み
If (search_plugins()) {
  Reload
}

search_plugins() {
  ; Pluginsフォルダ内のAHKスクリプト名を整形してplugin_filesに格納
  plugin_files := ""
  Loop, %A_ScriptDir%\Plugins\*.ahk {
    plugin_files .= "#" . "Include *i %A_ScriptDir%\Plugins\" . A_LoopFileName . "`n"
  }
  If (plugin_files == "") {
    Return 0
  }
  ; Pluginsの変更点を認識
  file := FileOpen(A_ScriptDir . "\PluginList.ahk", "r `n", "utf-8")
  If (file) {
    plugin_list_old := file.Read(file.Length)
    file.Close
    If (plugin_list_old == plugin_files) {
      Return 0
    }
  }
  ; plugin_list_oldをplugin_filesに書き換える
  file := FileOpen(A_ScriptDir . "\PluginList.ahk", "w `n", "utf-8")
  If (!file) {
    Return 0
  }
  file.Write(plugin_files)
  file.Close
  Return 1
}

; (AutoExexuteここまで)

#Include, %A_ScriptDir%\PluginList.ahk
