#!/bin/sh

echo "=================================================================="
echo "ci_post_clone Script"
echo "=================================================================="
brew tap tuist/tuist
echo "installing Tuist.."
brew install tuist@4.30.0
echo "installed Tuist"
echo "------------------------------------------------------------------"

cd ..
echo "tuist cleaning"
tuist clean
echo "tuist installing"
tuist install

# *.xcconfig 파일이 생성될 폴더 경로
FOLDER_PATH="/Volumes/workspace/repository/Projects/toduck/SupportingFiles"
# 폴더가 없으면 생성
mkdir -p "$FOLDER_PATH"
# *.xcconfig 파일 이름
DEBUG_CONFIG_FILENAME="Debug.xcconfig"
RELEASE_CONFIG_FILENAME="Release.xcconfig"

DEBUG_CONFIG_FILE_PATH="$FOLDER_PATH/$DEBUG_CONFIG_FILENAME"
RELEASE_CONFIG_FILE_PATH="$FOLDER_PATH/$RELEASE_CONFIG_FILENAME"

echo "Updating $DEBUG_CONFIG_FILE_PATH..."
{
    echo "SERVER_URL = $SERVER_URL"
    echo "API_KEY = $API_KEY"
    echo "CODE_SIGN_IDENTITY = Apple Development"
    echo "CODE_SIGN_STYLE = Manual"
    echo "DEVELOPMENT_TEAM = $DEVELOPMENT_TEAM"
    echo "PROVISIONING_PROFILE_SPECIFIER = $PROVISIONING_PROFILE_SPECIFIER"
    echo "PRODUCT_BUNDLE_IDENTIFIER = $PRODUCT_BUNDLE_IDENTIFIER"
    echo "PRODUCT_NAME = toduck"
} >> "$DEBUG_CONFIG_FILE_PATH"

echo "Updating $RELEASE_CONFIG_FILE_PATH..."
{
    echo "SERVER_URL = $SERVER_URL"
    echo "API_KEY = $API_KEY"
    echo "CODE_SIGN_IDENTITY = Apple Development"
    echo "CODE_SIGN_STYLE = Manual"
    echo "DEVELOPMENT_TEAM = $DEVELOPMENT_TEAM"
    echo "PROVISIONING_PROFILE_SPECIFIER = $PROVISIONING_PROFILE_SPECIFIER"
    echo "PRODUCT_BUNDLE_IDENTIFIER = $PRODUCT_BUNDLE_IDENTIFIER"
    echo "PRODUCT_NAME = toduck"
} >> "$RELEASE_CONFIG_FILE_PATH"

echo "=================================================================="
echo "CONFIG FILE >>"
cat $DEBUG_CONFIG_FILE_PATH
echo "=================================================================="

echo "tuist generating"
tuist generate
echo "=================================================================="
echo "tuist setting finish"
echo "=================================================================="

