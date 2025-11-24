@echo off

echo ============================================
echo Stable Diffusion WebUI - Python 3.14
echo ============================================
echo.
echo Using CPU-only PyTorch (Python 3.14 compatible)
echo For GPU support, install Python 3.10 or 3.11
echo.

set COMMANDLINE_ARGS=--skip-python-version-check --skip-torch-cuda-test --no-half

echo Starting Stable Diffusion WebUI...
echo.

call webui.bat

pause
