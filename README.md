# emulator-fbneo-sdl2-compile
Compile the FBNeo emulator (SDL2 version) within docker, uses a ubuntu base image

### Build image
``` docker build -t emulator-fbneo-sdl2-compile .```

### Compile FBNeo
``` docker run -d --rm -e RELEASE=1 -e COMMIT=master -v <host path>:/home/emudev emulator-fbneo-sdl2-compile:latest ```

### Output
FBANeo will be compiled to <host path>

### Build dats
``` ./build_dats ``` will compile run the emulator dump the dats. this only 
exists for me to build diff/delta dats for the emu without having to do much 
work but you're welcome to tweak it. The diffing tool is unreleased atm.

### Scripts
``` ./run_container ``` will build the normal version
``` ./run_container_debug ``` will build the debug version

### ENV Vars
* RELEASE=<n> 1 build release, 0 build debug
* COMMIT=<hash> commit hash, tag, branch etc

### docker logs
``` docker logs --follow emulator-fbneo-sdl2-compile ``` follow the compilation

this is based off ubuntu bionic for the time being, feel free to fork

- sairuk
