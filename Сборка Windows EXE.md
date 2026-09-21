# Сборка Windows EXE

## Вариант 1: из IntelliJ IDEA или CMD

Положите рядом в одну папку:

```text
Screenshot_translator.py
requirements.txt
screenshot_translator.ico
screenshot_translator.png
build_windows.bat
```

Если основной файл называется `app.py`, скрипт автоматически создаст копию с именем `Screenshot_translator.py`.

Запустите двойным щелчком:

```text
build_windows.bat
```

Или из терминала:

```bat
cd /d "C:\IntelliJ IDEA_PROJECT\Screenshot_translator"
build_windows.bat
```

После успешной сборки файл будет здесь:

```text
dist\Screenshot_Translator.exe
```

## Вариант 2: команды вручную

```bat
cd /d "C:\IntelliJ IDEA_PROJECT\Screenshot_translator"
python -m pip install --upgrade pyinstaller
python -m pip install -r requirements.txt
python -m PyInstaller --noconfirm --clean --onefile --windowed ^
  --name Screenshot_Translator ^
  --icon screenshot_translator.ico ^
  --add-data "screenshot_translator.ico;." ^
  --add-data "screenshot_translator.png;." ^
  Screenshot_translator.py
```

Готовое приложение появится в папке `dist`.

## Важные замечания

Сборку `.exe` нужно выполнять на Windows, потому что PyInstaller создаёт исполняемый файл для текущей операционной системы. Linux не создаёт корректный Windows `.exe` обычной командой PyInstaller.

`--onefile` создаёт один исполняемый файл. Первый запуск может быть немного дольше, потому что PyInstaller распаковывает временные файлы.

`--windowed` не открывает чёрное окно консоли.

После сборки настройки приложения сохраняются отдельно в:

```text
%USERPROFILE%\.screenshot_translator\settings.json
```

API-ключ не встраивается в `.exe`. Его нужно указать в настройках уже после запуска собранного приложения.

Антивирус Windows может проверить новый неподписанный exe-файл или показать предупреждение SmartScreen. Это стандартное поведение для локально собранных приложений без цифровой подписи.
