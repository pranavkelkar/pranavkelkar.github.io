#! /bin/bash

# remove old html pages
rm *.html

# update build date
BUILD_DATE=$(date)
sed -i "s/^<p>Last Updated.*/<p>Last Updated: $BUILD_DATE<\/p>/g" includes/footer.html

# build new html pages with pandoc
find . -name \*.md -type f -exec pandoc -c includes/style.css -B includes/header.html -A includes/footer.html -o {}.html {} \;
find . -depth -name '*.md.html' -execdir bash -c 'mv -i "$1" "${1//md.html/html}"' bash {} \;

# done
