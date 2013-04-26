#/bin/bash

#Try and build the file
  read -p "Press [Enter] to start the build. This will build the Haskell code."
  rm ./preprocess
  ghc --make ./Main.hs
  
#Remove root-level object files
  read -p "Press [Enter] to Clean the source and rename the executable."
  rm ./Main.hi
  rm ./Main.o

  rm ./ProjectSpecific.hi
  rm ./ProjectSpecific.o

  rm ./Replace.hi
  rm ./Replace.o

#Remove LibHaskell object files
  rm ./LibHaskell/LibLists.hi
  rm ./LibHaskell/LibLists.o

  rm ./LibHaskell/LibStrings.hi
  rm ./LibHaskell/LibStrings.o

#Rename the executable
  mv ./Main ./preprocess
  chmod +x ./preprocess

read -p "Press [Enter] to build the DEBIAN file."
#Make the .deb file.
  #Prepare the build
  cp ./README.md ./DEBIAN/usr/share/doc/preprocess/README
  cp ./langdefines ./DEBIAN/etc/preprocess/langdefines
  rm *.deb

  #Attempt the build
  fakeroot dpkg -b DEBIAN
  
  #Clean the build
  dpkg-name *.deb

read -p "Press [Enter] to add all changes and updates to git."
#Initialize git
  git add *
  git add -u