#!/bin/bash
#export SWT_GTK3=0

. /usr/local/crashplan/install.vars
. /usr/local/crashplan/bin/run.conf

export TARGETDIR=/usr/local/crashplan

cd /usr/local/crashplan/

n=0
until [ $n -ge 2 ]
do
  ${JAVACOMMON} ${GUI_JAVA_OPTS} -Dorg.eclipse.swt.internal.gtk.cairoGraphics=false -classpath "./lib/com.backup42.desktop.jar:./lang:./skin" com.backup42.desktop.CPDesktop \
   && break
  n=$[$n+1]
done
