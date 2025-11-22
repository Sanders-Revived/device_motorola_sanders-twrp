TWRP device tree for Moto G5S Plus (sanders)
==================================
## Device specifications

Basic   | Spec Sheet
-------:|:-------------------------
CPU     | Octa-core 2.0 GHz Cortex-A53
CHIPSET | Qualcomm MSM8953 Snapdragon 625
GPU     | Adreno 506
Memory  | 3/4 GB RAM
Shipped Android Version | 7.0.0
Internal Storage | 32/64 GB
microSD | Up to 256 GB
Battery | Li-Ion 3000mAh battery
Dimensions | 153.5 x 76.2 x 8 mm
Display | 1080 x 1920 pixels, 5.2 inches (~402 ppi pixel density)
Camera  | Dual 13 MP, f/2.0, autofocus, dual-LED (dual tone) flash

![Moto G5S Plus](https://files.catbox.moe/shi6rw.png "Moto G5S Plus")

### Kernel Source

See /prebuilt/README.md

### How to compile

```sh
. build/envsetup.sh
lunch twrp_sanders-eng
mka recoveryimage
