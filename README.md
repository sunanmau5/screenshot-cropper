# Screenshot Cropper

A script to automatically crop iOS Simulator screenshots by removing the simulator chrome while keeping the device frame.

## Prerequisites

- macOS
- ImageMagick (`brew install imagemagick`)

## Installation

1. Clone this repository or download the scripts
2. Make the script executable:
   ```bash
   chmod +x crop-screenshots.sh
   ```

## Usage

### Single Image
To crop a single screenshot:
```bash
./crop-screenshots.sh /path/to/your/screenshot.png
```
The cropped image will be saved as `cropped_screenshot.png` in the same directory

### Batch Processing
To crop multiple screenshots:
```bash
./crop-screenshots.sh /path/to/your/screenshots
```
All cropped images will be saved in a new `cropped` subdirectory

## What it does

- Removes exactly 52 pixels from the top (simulator chrome)
- Trims any transparent edges
- Preserves the device frame
- Maintains image quality

## Example

Single file:
```
/screenshots
├── screenshot.png
└── cropped_screenshot.png
```

Directory:
```
/screenshots
├── screenshot1.png
├── screenshot2.png
├── screenshot3.png
└── cropped/
    ├── screenshot1.png
    ├── screenshot2.png
    └── screenshot3.png
```