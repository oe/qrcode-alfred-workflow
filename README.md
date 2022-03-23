# qrcode-alfred-workflow
generate QRCode in alfred workflow

![usage demo](assets/usage.gif)

*Credits*: This is a swift clone of a php version(no original url found :( ) created by [WensonSmith](https://seekbetter.me). Due to the latest release of macOS 12.3, python2 has been removed, which broke the original workflow. So I reimplemented this workflow in Swift. It should be much more stable and faster.

## Install
### Requirements
1. you should have unlocked [Powerpack in Alfred](https://www.alfredapp.com/powerpack/)
2. make sure you have `swift` available in terminal.(**If you have `Xcode` installed, you can skip this step.**):
   1. type `swift --version` in terminal, if you don't see any version info output, following next step to install it.
   2. type `xcode-select --install` in terminal to install swift cli tools

### Install
[download workflow](https://github.com/oe/qrcode-alfred-workflow/raw/main/QRCode.alfredworkflow) then click the downloaded file to install

## Usage
launch alfred then input `qr` and `your QRCode content` separated with a space, press enter to view the QRCode immediately.

## Contributions and Support
I'm new to swift, feel free to make a pull request if you are willing to improve the code quality or its functions.

