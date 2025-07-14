#!/bin/bash

echo "🔧 Setting up PDF to Image Converter"
echo "===================================="

# Detect operating system
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    echo "🍎 Detected macOS"
    
    # Check if Homebrew is installed
    if ! command -v brew &> /dev/null; then
        echo "❌ Homebrew not found. Please install Homebrew first:"
        echo "   /bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
        exit 1
    fi
    
    echo "📦 Installing poppler (required for PDF processing)..."
    brew install poppler
    
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux
    echo "🐧 Detected Linux"
    
    # Detect package manager and install poppler
    if command -v apt-get &> /dev/null; then
        echo "📦 Installing poppler using apt..."
        sudo apt-get update
        sudo apt-get install -y poppler-utils
    elif command -v yum &> /dev/null; then
        echo "📦 Installing poppler using yum..."
        sudo yum install -y poppler-utils
    elif command -v dnf &> /dev/null; then
        echo "📦 Installing poppler using dnf..."
        sudo dnf install -y poppler-utils
    elif command -v pacman &> /dev/null; then
        echo "📦 Installing poppler using pacman..."
        sudo pacman -S poppler
    else
        echo "❌ Could not detect package manager. Please install poppler manually:"
        echo "   Ubuntu/Debian: sudo apt-get install poppler-utils"
        echo "   CentOS/RHEL: sudo yum install poppler-utils"
        echo "   Fedora: sudo dnf install poppler-utils"
        echo "   Arch: sudo pacman -S poppler"
        exit 1
    fi
    
elif [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "cygwin" ]]; then
    # Windows (Git Bash or Cygwin)
    echo "🪟 Detected Windows"
    echo "⚠️  Please install poppler manually:"
    echo "   1. Download from: https://github.com/oschwartz10612/poppler-windows/releases/"
    echo "   2. Extract to a folder (e.g., C:\\poppler)"
    echo "   3. Add C:\\poppler\\bin to your PATH environment variable"
    echo "   4. Restart your terminal and run this script again"
    
    # Check if poppler is in PATH
    if ! command -v pdftoppm &> /dev/null; then
        echo "❌ poppler not found in PATH. Please install it first."
        exit 1
    else
        echo "✅ poppler found in PATH"
    fi
    
else
    echo "❓ Unknown operating system: $OSTYPE"
    echo "   Please install poppler manually for your system"
    exit 1
fi

# Install Python dependencies
echo ""
echo "🐍 Installing Python dependencies..."

# Check if Python is available
if ! command -v python3 &> /dev/null; then
    if ! command -v python &> /dev/null; then
        echo "❌ Python not found. Please install Python 3.7+ first."
        exit 1
    else
        PYTHON_CMD="python"
    fi
else
    PYTHON_CMD="python3"
fi

echo "   Using: $PYTHON_CMD"

# Install pip if not available
if ! $PYTHON_CMD -m pip --version &> /dev/null; then
    echo "📦 Installing pip..."
    $PYTHON_CMD -m ensurepip --default-pip
fi

# Install requirements
if [ -f "requirements.txt" ]; then
    echo "📦 Installing from requirements.txt..."
    $PYTHON_CMD -m pip install -r requirements.txt
else
    echo "📦 Installing pdf2image and Pillow..."
    $PYTHON_CMD -m pip install pdf2image Pillow
fi

# Test installation
echo ""
echo "🧪 Testing installation..."
$PYTHON_CMD -c "
try:
    from pdf2image import convert_from_path
    from PIL import Image
    print('✅ All dependencies installed successfully!')
except ImportError as e:
    print(f'❌ Import error: {e}')
    exit(1)
"

if [ $? -eq 0 ]; then
    echo ""
    echo "🎉 Setup completed successfully!"
    echo ""
    echo "📋 Usage:"
    echo "   $PYTHON_CMD convert_pdf_to_image.py"
    echo ""
    echo "📋 Options:"
    echo "   $PYTHON_CMD convert_pdf_to_image.py --dpi 300 --backup"
    echo ""
    echo "Make sure your PDF file 'Harsh_Singh_Software_Engineer_Resume.pdf' is in the current directory."
else
    echo ""
    echo "❌ Setup failed. Please check the error messages above."
    exit 1
fi