@echo off
echo ========================================
echo 🚀 DSA Problem Tracker Launcher
echo ========================================
echo.

echo Checking prerequisites...
echo.

REM Check if Java is installed
java -version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Java is not installed or not in PATH
    echo Please install Java 17 from: https://adoptium.net/temurin/releases/
    echo.
    pause
    exit /b 1
)

REM Check if Maven is installed
mvn -version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Maven is not installed or not in PATH
    echo Please install Maven from: https://maven.apache.org/download.cgi
    echo.
    pause
    exit /b 1
)

echo ✅ Prerequisites check passed!
echo.

echo ========================================
echo Building and running your application...
echo ========================================
echo.

REM Clean and install dependencies
echo 📦 Installing dependencies...
call mvn clean install
if %errorlevel% neq 0 (
    echo ❌ Build failed! Check the error messages above.
    pause
    exit /b 1
)

echo.
echo ✅ Build successful!
echo.

REM Run the application
echo 🚀 Starting Spring Boot application...
echo.
echo Your application will be available at:
echo 🌐 Web UI: http://localhost:8080
echo 🗄️ H2 Console: http://localhost:8080/h2-console
echo.
echo Press Ctrl+C to stop the application
echo.

call mvn spring-boot:run

pause