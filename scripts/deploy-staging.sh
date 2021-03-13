#!/usr/bin/env bash

if [[ "$TRAVIS_PULL_REQUEST" == "false" ]]; then

    echo -e "Running staging script...\n"
    echo -e "Publishing javadocs and artifacts...\n"
    cd $HOME

    rsync -r --quiet -e "ssh -p 2222 -o StrictHostKeyChecking=no" \
    $HOME/build/uskyblock/uSkyBlock/po-utils/target/mvn-repo/ \
    travis@travis.internetpolice.eu:WWW-USB/maven/uskyblock/

    rsync -r --quiet -e "ssh -p 2222 -o StrictHostKeyChecking=no" \
    $HOME/build/uskyblock/uSkyBlock/target/mvn-repo/ \
    travis@travis.internetpolice.eu:WWW-USB/maven/uskyblock/

    rsync -r --quiet -e "ssh -p 2222 -o StrictHostKeyChecking=no" \
    $HOME/build/uskyblock/uSkyBlock/uSkyBlock-API/target/mvn-repo/ \
    travis@travis.internetpolice.eu:WWW-USB/maven/uskyblock/

    rsync -r --quiet -e "ssh -p 2222 -o StrictHostKeyChecking=no" \
    $HOME/build/uskyblock/uSkyBlock/uSkyBlock-AWE370/target/mvn-repo/ \
    travis@travis.internetpolice.eu:WWW-USB/maven/uskyblock/

    rsync -r --quiet -e "ssh -p 2222 -o StrictHostKeyChecking=no" \
    $HOME/build/uskyblock/uSkyBlock/uSkyBlock-Core/target/mvn-repo/ \
    travis@travis.internetpolice.eu:WWW-USB/maven/uskyblock/

    rsync -r --quiet -e "ssh -p 2222 -o StrictHostKeyChecking=no" \
    $HOME/build/uskyblock/uSkyBlock/uSkyBlock-FAWE/target/mvn-repo/ \
    travis@travis.internetpolice.eu:WWW-USB/maven/uskyblock/

    rsync -r --quiet -e "ssh -p 2222 -o StrictHostKeyChecking=no" \
    $HOME/build/uskyblock/uSkyBlock/uSkyBlock-Plugin/target/mvn-repo/ \
    travis@travis.internetpolice.eu:WWW-USB/maven/uskyblock/

    echo -e "Publishing javadocs...\n"

    rsync -r --delete --quiet -e "ssh -p 2222 -o StrictHostKeyChecking=no" \
    $HOME/build/uskyblock/uSkyBlock/po-utils/target/site/apidocs/ \
    travis@travis.internetpolice.eu:WWW-USB/javadocs/master/po-utils/

    rsync -r --delete --quiet -e "ssh -p 2222 -o StrictHostKeyChecking=no" \
    $HOME/build/uskyblock/uSkyBlock/uSkyBlock-API/target/site/apidocs/ \
    travis@travis.internetpolice.eu:WWW-USB/javadocs/master/uSkyBlock-API/

    rsync -r --delete --quiet -e "ssh -p 2222 -o StrictHostKeyChecking=no" \
    $HOME/build/uskyblock/uSkyBlock/uSkyBlock-Core/target/site/apidocs/ \
    travis@travis.internetpolice.eu:WWW-USB/javadocs/master/uSkyBlock-Core/

    echo -e "Publishing final plugin release...\n"

    rsync -r --quiet -e "ssh -p 2222 -o StrictHostKeyChecking=no" \
    $HOME/build/uskyblock/uSkyBlock/uSkyBlock-Plugin/target/uSkyBlock-*.jar \
    travis@travis.internetpolice.eu:WWW-USB/downloads/master/uSkyBlock/

fi
