@echo off
echo ------------------------------
echo 　スクリーンショット撮影開始　
echo ------------------------------
echo 0.日時を取得
set yyyy=%date:~0,4%
set mm=%date:~5,2%
set dd=%date:~8,2%
set time2=%time: =0%
 
set hh=%time2:~0,2%
set mn=%time2:~3,2%
set ss=%time2:~6,2%

set datetime=%yyyy%-%mm%%dd%-%hh%%mn%%ss%
rem testここから
set USR_INPUT_PFX=
if "%1" == "" (
  echo ファイル名の先頭に付ける文言を設定できます
  echo 任意の文字を入力して[Enter]を押してください
  set /P USR_INPUT_PFX="設定しない場合はこのまま[Enter]を押してください"
  if "%USR_INPUT_PFX%" == "" (
    echo 入力値はありません
    set prefix=
  ) else (
    set prefix=!USR_INPUT_PFX!
  )
) else (
  set prefix=%1
)
set filename=%prefix%_screencap%datetime%.png
echo 保存名：%filename% で撮影を行います
rem testここまで
echo 1.端末内にスクリーンショットを保存
adb shell screencap -p /sdcard/%filename%
echo 2.画像をPCにコピー
adb pull /sdcard/%filename% %~dp0/
echo 保存先：%~dp0/%
echo 3.端末に残った画像を削除
adb shell rm /sdcard/%filename%
echo スクリーンショット撮影完了
echo ------------------------------
echo 　スクリーンショット撮影終了　
echo ------------------------------
echo 何も入力せず[Enter]を押すと続けて撮影できます ※タイトルの先頭は記憶されています
set USR_INPUT_STR=
rem 入力要求
set /P USR_INPUT_STR="終了する際はこのままウィンドウを閉じてください"
IF "%USR_INPUT_STR%" == "" (
  if prefix == "" (
    call %~dp0/ScreenShotCapture.bat
  ) else (
    call %~dp0/ScreenShotCapture.bat %prefix%
  )
) ELSE ( 
    call %~dp0/ScreenShotCapture.bat %USR_INPUT_STR%
)