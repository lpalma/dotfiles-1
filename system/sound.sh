#!/usr/bin/env bash

soundHeadphonesOutput() {
  ponymix set-profile output:analog-stereo
}

soundMonitorOutput() {
  ponymix set-profile output:hdmi-stereo
}

soundTvOutput() {
  ponymix set-profile output:hdmi-stereo-extra1
}
