# oscillograph-party

Audio-reactive vacuum-tube oscillograph visualizer for OLED laptops in tent mode.

## Features
- Pure `#000000` OLED background with phosphor persistence trails
- Real-time webcam Sobel edge + motion-delta contour detection
- Sub-bass & kick-focused Web Audio `AnalyserNode` (`fftSize = 2048`)
- 5 visual modes: `OSCILLOGRAPH LINE`, `VECTOR CONTOURS`, `TUBE SCANLINES`, `PHOSPHOR MATRIX`, `LISSAJOUS MORPH`
- Auto-hiding controls, Screen Wake Lock (`WAKE`), and Fullscreen (`F`)

## Launch
Double-click `launch-oscillograph.bat` (serves on `http://localhost:8766/` for camera & mic permissions).
