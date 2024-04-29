^!m::
    jsonPath := A_ScriptDir "\Plugins\map_uri.json"

    InputBox, user_input, 顧客名を入力, 顧客名を入力してください。, , 200, 150

    Run, % "python " A_WorkingDir "\Scripts\multi_launcher.py Plugins\map_uri.json " user_input

    Return
