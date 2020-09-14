#!/bin/zsh

#  run_uitests_parallel.sh
#  ParallelUITests
#
#  Created by Tristian Azuara on 9/13/20.
#  Copyright © 2020 Tristian Azuara. All rights reserved.
set -e

device_name="CI UI Parallel"
echo "=> Creating new device: '$device_name'"
device_udid=$(xcrun simctl create "$device_name" "iPhone 8")
echo "=> Created new device: '$device_name' $device_udid"

echo "=> Disabling Hardware Keyboard for: $device_udid"

alias plist=/usr/libexec/PlistBuddy
simprefs="$HOME/Library/Preferences/com.apple.iphonesimulator.plist"
plist -c "Set :DevicePreferences:$device_udid:ConnectHardwareKeyboard true" "$simprefs" \
    || plist -c "Add :DevicePreferences:$device_udid:ConnectHardwareKeyboard bool true" "$simprefs";

BUILD_DIR=$(mktemp -d)
SYMROOT="$BUILD_DIR"

echo "=> Building for Testing: "
echo "=> Build Directory: $BUILD_DIR"

xcodebuild build-for-testing \
    -project ./ParallelUITests.xcodeproj -scheme ParallelUITests \
    -destination "platform=iOS Simulator,id=$device_udid" \
    SYMROOT=$BUILD_DIR \
    BUILD_DIR=$BUILD_DIR


echo "=> Pre-booting Source Device: $device_udid"
xcrun simctl boot $device_udid
xcrun simctl bootstatus $device_udid && sleep 2

testrun=$(find "$BUILD_DIR" -name '*Parallel UI Tests*.xctestrun')
echo "=> Found Test Run File: $testrun"

result_bundle="$BUILD_DIR/$device_name.xcresult"
echo "=> Result Bundle: $result_bundle"

echo "=> Running Tests (Parallel)"
xcodebuild test-without-building \
  -destination "platform=iOS Simulator,id=$device_udid" \
  -xctestrun "$testrun" \
  -resultBundlePath "$result_bundle"

echo "=> Archiving Results"
bundle_name=$(basename "$result_bundle")
cd $(dirname "$result_bundle")
zip -r "$bundle_name.zip" "$bundle_name"
