#!/usr/local/bin/bash
COMPILED_FOLDER="Compiled"
SRC_FOLDER="src"

echo "Copy Light Shell variant."
rm -rf $COMPILED_FOLDER/Redwaita-Light-Shell/gnome-shell/assets
mkdir -p $COMPILED_FOLDER/Redwaita-Light-Shell/gnome-shell/assets
sassc -t expanded $SRC_FOLDER/gnome-shell/gnome-shell-light.scss $COMPILED_FOLDER/Redwaita-Light-Shell/gnome-shell/gnome-shell.css
cp -rf $SRC_FOLDER/gnome-shell/light-assets/* $COMPILED_FOLDER/Redwaita-Light-Shell/gnome-shell/assets

for variant in '' '-Vanilla' '-OSX'; do
    echo "Copy Shell for each variant. (Redwaita${variant})"
    rm -rf $COMPILED_FOLDER/Redwaita${variant}/Redwaita${variant}

    mkdir -p $COMPILED_FOLDER/Redwaita${variant}/Redwaita${variant}/gnome-shell/assets
    sassc -t expanded $SRC_FOLDER/gnome-shell/gnome-shell.scss $COMPILED_FOLDER/Redwaita${variant}/Redwaita${variant}/gnome-shell/gnome-shell.css
    cp -rf $SRC_FOLDER/gnome-shell/dark-assets/* $COMPILED_FOLDER/Redwaita${variant}/Redwaita${variant}/gnome-shell/assets

    lvariant=`echo $variant | tr '[:upper:]' '[:lower:]'`
    mkdir -p $COMPILED_FOLDER/Redwaita${variant}/Redwaita${variant}/gtk-3.0
    mkdir -p $COMPILED_FOLDER/Redwaita${variant}/Redwaita${variant}-Darker/gtk-3.0
    sassc -t expanded $SRC_FOLDER/gtk-3.0/gtk${lvariant}.scss $COMPILED_FOLDER/Redwaita${variant}/Redwaita${variant}/gtk-3.0/gtk.css
    sassc -t expanded $SRC_FOLDER/gtk-3.0/gtk${lvariant}-dark.scss $COMPILED_FOLDER/Redwaita${variant}/Redwaita${variant}/gtk-3.0/gtk-dark.css
    sassc -t expanded $SRC_FOLDER/gtk-3.0/gtk${lvariant}-darker.scss $COMPILED_FOLDER/Redwaita${variant}/Redwaita${variant}-Darker/gtk-3.0/gtk.css
    sassc -t expanded $SRC_FOLDER/gtk-3.0/gtk${lvariant}-dark.scss $COMPILED_FOLDER/Redwaita${variant}/Redwaita${variant}-Darker/gtk-3.0/gtk-dark.css

    mkdir -p $COMPILED_FOLDER/Redwaita${variant}/Redwaita${variant}/gtk-2.0/assets
    mkdir -p $COMPILED_FOLDER/Redwaita${variant}/Redwaita${variant}-Darker/gtk-2.0/assets
    cp $SRC_FOLDER/gtk-2.0/assets/* $COMPILED_FOLDER/Redwaita${variant}/Redwaita${variant}/gtk-2.0/assets
    cp $SRC_FOLDER/gtk-2.0/assets/* $COMPILED_FOLDER/Redwaita${variant}/Redwaita${variant}-Darker/gtk-2.0/assets
    cp $SRC_FOLDER/gtk-2.0/assets-dark/menubar-item-active.png $COMPILED_FOLDER/Redwaita${variant}/Redwaita${variant}-Darker/gtk-2.0/assets
    cp $SRC_FOLDER/gtk-2.0/gtkrc $COMPILED_FOLDER/Redwaita${variant}/Redwaita${variant}/gtk-2.0/gtkrc
    cp $SRC_FOLDER/gtk-2.0/gtkrc-darker $COMPILED_FOLDER/Redwaita${variant}/Redwaita${variant}-Darker/gtk-2.0/gtkrc
    cp $SRC_FOLDER/gtk-2.0/common-files/* $COMPILED_FOLDER/Redwaita${variant}/Redwaita${variant}/gtk-2.0/
    cp $SRC_FOLDER/gtk-2.0/common-files/* $COMPILED_FOLDER/Redwaita${variant}/Redwaita${variant}-Darker/gtk-2.0/

    cp -r $SRC_FOLDER/xfwm4 $COMPILED_FOLDER/Redwaita${variant}/Redwaita${variant}/xfwm4
    cp -r $SRC_FOLDER/xfwm4 $COMPILED_FOLDER/Redwaita${variant}/Redwaita${variant}-Darker/xfwm4

    for color in '-Dark'; do
        rm -rf $COMPILED_FOLDER/Redwaita${variant}/Redwaita${variant}${color}
        mkdir -p $COMPILED_FOLDER/Redwaita${variant}/Redwaita${variant}${color}/gtk-3.0
        mkdir -p $COMPILED_FOLDER/Redwaita${variant}/Redwaita${variant}${color}/gtk-2.0/assets
        sassc -t expanded $SRC_FOLDER/gtk-3.0/gtk${lvariant}-dark.scss $COMPILED_FOLDER/Redwaita${variant}/Redwaita${variant}${color}/gtk-3.0/gtk.css
        cp $SRC_FOLDER/gtk-2.0/assets-dark/* $COMPILED_FOLDER/Redwaita${variant}/Redwaita${variant}${color}/gtk-2.0/assets
        cp $SRC_FOLDER/gtk-2.0/gtkrc-dark $COMPILED_FOLDER/Redwaita${variant}/Redwaita${variant}${color}/gtk-2.0/gtkrc
        cp $SRC_FOLDER/gtk-2.0/common-files/* $COMPILED_FOLDER/Redwaita${variant}/Redwaita${variant}${color}/gtk-2.0/
        cp $SRC_FOLDER/gtk-2.0/dark-variant-files/* $COMPILED_FOLDER/Redwaita${variant}/Redwaita${variant}${color}/gtk-2.0/
        cp -r $SRC_FOLDER/xfwm4 $COMPILED_FOLDER/Redwaita${variant}/Redwaita${variant}${color}/xfwm4
    done
done
