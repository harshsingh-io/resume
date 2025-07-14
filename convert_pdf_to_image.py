#!/usr/bin/env python3
"""
PDF to Image Converter for Resume Website
Converts Harsh_Singh_Software_Engineer_Resume.pdf to preview image
"""

import os
import sys
from pathlib import Path
from PIL import Image
import argparse

try:
    from pdf2image import convert_from_path
except ImportError:
    print("❌ pdf2image not found. Installing...")
    os.system("pip install pdf2image pillow")
    from pdf2image import convert_from_path

def convert_pdf_to_image(pdf_path, output_path, dpi=300, quality=95):
    """
    Convert PDF to high-quality image for social media preview
    
    Args:
        pdf_path (str): Path to PDF file
        output_path (str): Path for output image
        dpi (int): Resolution for conversion (default: 300)
        quality (int): JPEG quality if saving as JPEG (default: 95)
    """
    try:
        print(f"🔄 Converting {pdf_path} to image...")
        
        # Convert PDF to images (just first page)
        pages = convert_from_path(
            pdf_path, 
            dpi=dpi,
            first_page=1,
            last_page=1,  # Only first page
            fmt='RGB'
        )
        
        if not pages:
            raise Exception("No pages found in PDF")
            
        # Get the first page
        page = pages[0]
        
        # Optimize for social media (1200x630 is ideal for most platforms)
        # But keep aspect ratio of original resume
        original_width, original_height = page.size
        
        # Calculate new dimensions maintaining aspect ratio
        # Target width for good social media preview
        target_width = 1200
        aspect_ratio = original_height / original_width
        target_height = int(target_width * aspect_ratio)
        
        # Resize image
        resized_page = page.resize((target_width, target_height), Image.Resampling.LANCZOS)
        
        # Save as PNG for best quality (no compression artifacts)
        resized_page.save(output_path, 'PNG', optimize=True)
        
        print(f"✅ Successfully converted to {output_path}")
        print(f"📏 Image dimensions: {target_width}x{target_height}")
        print(f"📁 File size: {os.path.getsize(output_path) / 1024:.1f} KB")
        
        return True
        
    except Exception as e:
        print(f"❌ Error converting PDF: {str(e)}")
        return False

def verify_files():
    """Verify required files exist"""
    pdf_file = "Harsh_Singh_Software_Engineer_Resume.pdf"
    
    if not os.path.exists(pdf_file):
        print(f"❌ PDF file not found: {pdf_file}")
        print("   Make sure the PDF file is in the current directory")
        return False
    
    print(f"✅ Found PDF file: {pdf_file}")
    return True

def backup_existing_image(image_path):
    """Create backup of existing image if it exists"""
    if os.path.exists(image_path):
        backup_path = image_path.replace('.png', '_backup.png')
        os.rename(image_path, backup_path)
        print(f"📦 Backed up existing image to: {backup_path}")

def main():
    parser = argparse.ArgumentParser(description='Convert resume PDF to preview image')
    parser.add_argument('--dpi', type=int, default=300, help='DPI for conversion (default: 300)')
    parser.add_argument('--quality', type=int, default=95, help='Image quality (default: 95)')
    parser.add_argument('--backup', action='store_true', help='Backup existing image')
    
    args = parser.parse_args()
    
    print("🎨 Resume PDF to Image Converter")
    print("=" * 35)
    
    # File paths
    pdf_file = "Harsh_Singh_Software_Engineer_Resume.pdf"
    image_file = "Harsh_Singh_Software_Engineer_Resume.png"
    
    # Verify files exist
    if not verify_files():
        sys.exit(1)
    
    # Backup existing image if requested
    if args.backup:
        backup_existing_image(image_file)
    
    # Convert PDF to image
    success = convert_pdf_to_image(
        pdf_file, 
        image_file, 
        dpi=args.dpi, 
        quality=args.quality
    )
    
    if success:
        print("\n🎉 Conversion completed successfully!")
        print("\n📋 Next steps:")
        print("1. Commit and push the new image file")
        print("2. The website will automatically use the new preview image")
        print("3. Test social media sharing to see the preview")
        
        print("\n🔗 Social Media Preview Testing:")
        print("- Facebook: https://developers.facebook.com/tools/debug/")
        print("- Twitter: https://cards-dev.twitter.com/validator")
        print("- LinkedIn: Share the URL and check preview")
        
    else:
        print("\n❌ Conversion failed!")
        sys.exit(1)

if __name__ == "__main__":
    main()