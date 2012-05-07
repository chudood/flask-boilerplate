#!/usr/bin/env bash

## Environment ##

SITE_CODE_DIR=$1
shift

[[ -n "$SITE_CODE_DIR" ]] || exit 1

source "$SITE_CODE_DIR/setup/bashutils.bash"

APP_NAME="flask_application"
BOOTSTRAP_DIR="$SITE_CODE_DIR/bootstrap"
STATIC_DIR="$SITE_CODE_DIR/$APP_NAME/static"
TEMPLATE_DIR="$SITE_CODE_DIR/$APP_NAME/templates"
PUBLIC_DIR="$SITE_CODE_DIR/../../public"
BOOTSTRAP_URL="http://twitter.github.com/bootstrap/assets/bootstrap.zip"
JQUERY_URL="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"
## Main ##

cd $SITE_CODE_DIR

rm -rf $BOOTSTRAP_DIR
mkdir $BOOTSTRAP_DIR

wget $BOOTSTRAP_URL -O /tmp/bootstrap.zip
unzip /tmp/bootstrap.zip -d $SITE_CODE_DIR

cp $BOOTSTRAP_DIR/apple-touch-icon.png $STATIC_DIR/apple-touch-icon.png
cp $BOOTSTRAP_DIR/favicon.ico $STATIC_DIR/favicon.ico

mkdir -p $STATIC_DIR/js

wget $JQUERY_URL -O $BOOTSTRAP_DIR/js
cp -r $BOOTSTRAP_DIR/js/*.js $STATIC_DIR/js/

mkdir -p $STATIC_DIR/css
cp $BOOTSTRAP_DIR/css/*.css $STATIC_DIR/css/


