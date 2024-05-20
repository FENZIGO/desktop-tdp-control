# Steam Deck TDP Management Applet

![alt text](https://i.imgur.com/pxDZ3mH.png)

This applet allows you to manage the TDP (Thermal Design Power) settings of your Steam Deck and other AMD devices directly from the desktop mode. Created for my own use, but it may be useful to someone.
Since the program to change the APU behavior uses [FlyGoat/RyzenAdj](https://github.com/FlyGoat/RyzenAdj), it also inherits all its functions. You can add your own flags from the widget configuration menu and save them as a preset. The Steam Deck chip is not fully supported by ryzenadj so some adj functions may not work.


![alt text](https://i.imgur.com/JiLI78g.png)

## Installation:

1. Download "SteamDeck.TDP.plasmoid" from releases.
2. Run "kpackagetool5 -i SteamDeck.TDP.plasmoid" from konsole in your Download directory.
3. On your desktop: PPM>Add Widgets... Add "SteamDeck TDP" widget.
4. By entering PPM>Enter Edit Mode, you can place the widget anywhere you want.

## Overclocked Steam Deck's and other devices:

If you want to increase the limit to more than 15W, you can do so by editing the main.qml file. After installation, the file is located in:
"/home/deck/.local/share/plasma/plasmoids/metadata/contents/ui" Just change value in line 34:

```
PlasmaComponents3.Slider {
  id: tdpSlider
  Layout.fillWidth: true
  from: 3
  to: 15 <<< This one
  value: 10
  stepSize: 1           
}
```     
Later I will add the ability to change the default values ​​in the configuration menu.

## When I find out how I will maybe add it:

- Fan curve configuration
- Battery charge limit
- Displaying the current temperature on the bar
