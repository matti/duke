#!/usr/bin/env sh
set -e

on_term () {
  echo "TERM: START"

  kill $pid_x11vnc
  echo "TERM: killed x11vnc"
  kill $pid_xvfb
  echo "TERM: killed xvfb"

  echo "TERM: DONE"
}

trap on_term TERM

forever () {
  while true; do
    set +e
      $@
    set -e
    echo "forever: $@ died, restarting"
    sleep 0.01
  done
}

Xvfb :0 -ac -listen tcp -screen 0 640x480x24 >logs/xvfb.out 2>logs/xvfb.err &
pid_xvfb=$!

while true; do
  set +e
    xdpyinfo -display :0 >/dev/null 2>&1
    xdpyinfo_code=$?
  set -e

  [ "$xdpyinfo_code" = 0 ] && break
  sleep 0.01
done

forever x11vnc -forever -passwd secret >logs/x11vnc.out 2>logs/x11vnc.err &
pid_x11vnc=$!

echo "xvfb, x11vnc started"
while true; do
  sleep inf &
  wait $!
done
