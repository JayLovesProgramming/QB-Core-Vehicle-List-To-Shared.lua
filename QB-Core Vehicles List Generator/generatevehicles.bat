@echo off
setlocal enabledelayedexpansion

REM -- Paths
set "inputFile=list.txt"
set "outputFile=vehicles.lua"

REM -- Check if input file exists
if not exist "%inputFile%" (
    echo Input file %inputFile% not found!
    timeout /t 2 >nul
    exit /b 1
)

REM -- Check if output file exists, if not create it
if not exist "%outputFile%" (
    echo -- Vehicles list > "%outputFile%"
    echo return { >> "%outputFile%"
) else (
    REM If output file exists, clear its contents before appending new data
    echo -- Vehicles list > "%outputFile%"
    echo return { >> "%outputFile%"
)

echo Processing vehicles...
timeout /t 1 >nul

REM -- Start appending to the Lua file
set "firstEntry=true"
for /f "tokens=*" %%i in (%inputFile%) do (
    set "model=%%i"
    set "name=%%i"
    set "brand=Unknown" REM Default brand, modify as needed
    set "price=10000" REM Default price, modify as needed
    set "category=compacts" REM Default category, modify as needed
    set "type=automobile" REM Default type, modify as needed
    set "shop=pdm" REM Default shop, modify as needed
    REM -- Output the current vehicle being processed
    echo Adding vehicle: model=!model!, name=!name!
    REM Append the new vehicle entry to the Lua file
    (
    echo     {
    echo         model = '!model!',
    echo         name = '!name!',
    echo         brand = '!brand!',
    echo         price = !price!,
    echo         category = '!category!',
    echo         type = '!type!',
    echo         shop = '!shop!',
    echo     },
    ) >> "%outputFile%"
)

echo } >> "%outputFile%"

echo Vehicles have been added to %outputFile%.

REM Wait for 10 seconds before closing
timeout /t 10 >nul
