@echo off
:: This script automates the setup and testing process for the Python project.

SET VENV_NAME= mnet_venv

:: 1. Create the virtual environment if it doesn't exist
IF NOT EXIST "%VENV_NAME%\" (
    echo "--- Creating virtual environment: %VENV_NAME% ---"
    python -m venv %VENV_NAME%
) ELSE (
    echo "--- Virtual environment already exists. ---"
)

:: 2. Activate the virtual environment
echo "--- Activating virtual environment ---"
call "%VENV_NAME%\Scripts\activate.bat"

:: 3. Upgrade pip
echo "--- Upgrading pip ---"
python.exe -m pip install --upgrade pip
IF %ERRORLEVEL% NEQ 0 (
    echo "Pip upgrade failed!"
    exit /b %ERRORLEVEL%
)

:: 4. Install the package in editable mode
echo "--- Installing local package in editable mode ---"
pip install -e .
IF %ERRORLEVEL% NEQ 0 (
    echo "Package installation failed!"
    exit /b %ERRORLEVEL%
)

:: 5. Install Jupyter Kernel for notebooks (NEW)
echo "--- Installing Jupyter kernel (ipykernel) ---"
pip install ipykernel pytest
IF %ERRORLEVEL% NEQ 0 (
    echo "ipykernel installation failed!"
    exit /b %ERRORLEVEL%
)

:: 6. Run tests with pytest
echo "--- Running tests with pytest ---"
pytest > pytest_log.txt 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo "Pytest failed!"
    exit /b %ERRORLEVEL%
)

echo "✨ --- Setup and tests completed successfully! --- ✨"