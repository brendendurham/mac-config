#!/bin/bash

# Bootstrap
BASEDIR=$(dirname $0)
cd $BASEDIR
CURRENT_DIR=`pwd`

echo "=== Start installing goku configuration ==="

echo "Step1: backing up current goku config"
today=`date +%Y%m%d`
for i in $HOME/.config/karabiner.edn; do
    [ -e $i ] && [ ! -L $i ] && mv $i $i.$today ;
done
for i in $HOME/.config/karabiner.edn; do
    [ -L $i ] && unlink $i ;
done

echo "Step2: setting up symlinks"
ln -sif $CURRENT_DIR/karabiner.edn $HOME/.config/karabiner.edn

echo "=== Install Done! ==="

# ln complex modifications to .config/karabiner/assets/complex_modifications

ln -sif $CURRENT_DIR/assets/complex_modifications $HOME/.config/karabiner/assets/complex_modifications
