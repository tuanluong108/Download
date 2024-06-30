#!/bin/bash

main() {
    echo -e "Downloading Latest Roblox"
    [ -f ./RobloxPlayer.zip ] && rm ./RobloxPlayer.zip
    curl "https://setup.rbxcdn.com/mac/version-ecb0dc61c2ff4160-RobloxPlayer.zip" -o "./RobloxPlayer.zip"

    echo -e "Installing Latest Roblox"
    [ -d "/Applications/Roblox.app" ] && rm -rf "/Applications/Roblox.app"
    unzip -o -q "./RobloxPlayer.zip"
    mv ./RobloxPlayer.app /Applications/Roblox.app
    rm ./RobloxPlayer.zip

    echo -e "Downloading RobloxCheat"
    rm ./RobloxCheats.dylib
    curl -LJO "https://github.com/tuanluong108/try/raw/main/RobloxCheats.dylib"

    echo -e "Downloading libESP"
    rm ./libESP.dylib
    curl -LJO "https://github.com/tuanluong108/try/raw/main/libESP.dylib"

    rm ./insert_dylib
    echo -e "Downloading insert_dylib"
    curl -LJO "https://github.com/tuanluong108/try/raw/main/insert_dylib"

    chmod +x "./insert_dylib"

    echo -e "Patching Roblox"
    mv ./RobloxCheats.dylib "/Applications/Roblox.app/Contents/MacOS/RobloxCheats.dylib"
    mv ./libESP.dylib "/Applications/Roblox.app/Contents/MacOS/libESP.dylib"
    ./insert_dylib "/Applications/Roblox.app/Contents/MacOS/libHydrogen.dylib" "/Applications/Roblox.app/Contents/MacOS/RobloxPlayer" --strip-codesig --all-yes
    mv "/Applications/Roblox.app/Contents/MacOS/RobloxPlayer_patched" "/Applications/Roblox.app/Contents/MacOS/RobloxPlayer"

    chmod +x "/Applications/Roblox.app/Contents/MacOS/RobloxCheats.dylib"

    echo -e "Install Complete!"
}

main
