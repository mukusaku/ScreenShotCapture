@echo off
echo ------------------------------
echo �@�X�N���[���V���b�g�B�e�J�n�@
echo ------------------------------
echo 0.�������擾
set yyyy=%date:~0,4%
set mm=%date:~5,2%
set dd=%date:~8,2%
set time2=%time: =0%
 
set hh=%time2:~0,2%
set mn=%time2:~3,2%
set ss=%time2:~6,2%

set datetime=%yyyy%-%mm%%dd%-%hh%%mn%%ss%
rem test��������
set USR_INPUT_PFX=
if "%1" == "" (
  echo �t�@�C�����̐擪�ɕt���镶����ݒ�ł��܂�
  echo �C�ӂ̕�������͂���[Enter]�������Ă�������
  set /P USR_INPUT_PFX="�ݒ肵�Ȃ��ꍇ�͂��̂܂�[Enter]�������Ă�������"
  if "%USR_INPUT_PFX%" == "" (
    echo ���͒l�͂���܂���
    set prefix=
  ) else (
    set prefix=!USR_INPUT_PFX!
  )
) else (
  set prefix=%1
)
set filename=%prefix%_screencap%datetime%.png
echo �ۑ����F%filename% �ŎB�e���s���܂�
rem test�����܂�
echo 1.�[�����ɃX�N���[���V���b�g��ۑ�
adb shell screencap -p /sdcard/%filename%
echo 2.�摜��PC�ɃR�s�[
adb pull /sdcard/%filename% %~dp0/
echo �ۑ���F%~dp0/%
echo 3.�[���Ɏc�����摜���폜
adb shell rm /sdcard/%filename%
echo �X�N���[���V���b�g�B�e����
echo ------------------------------
echo �@�X�N���[���V���b�g�B�e�I���@
echo ------------------------------
echo �������͂���[Enter]�������Ƒ����ĎB�e�ł��܂� ���^�C�g���̐擪�͋L������Ă��܂�
set USR_INPUT_STR=
rem ���͗v��
set /P USR_INPUT_STR="�I������ۂ͂��̂܂܃E�B���h�E����Ă�������"
IF "%USR_INPUT_STR%" == "" (
  if prefix == "" (
    call %~dp0/ScreenShotCapture.bat
  ) else (
    call %~dp0/ScreenShotCapture.bat %prefix%
  )
) ELSE ( 
    call %~dp0/ScreenShotCapture.bat %USR_INPUT_STR%
)