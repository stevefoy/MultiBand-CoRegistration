# MultiSpectral-CoRegistration

This repository provides an implementation for overlaying images captured by cameras fixed in a rig, such as the Parrot Sequoia and RedEdge MicaSense. This work is based on the following paper:

**Shahbazi, M. and Cortes, C., 2019. Seamless Co-Registration of Images from Multi-Sensor Multispectral Cameras.** The International Archives of Photogrammetry, Remote Sensing and Spatial Information Sciences, 42, pp. 315-322.

## Branch for Linux Build

A dedicated branch has been created for building and running this project on Linux systems. Please switch to the `linux-build` branch to access these changes.

## Building on Linux

To build the project on Linux using OpenMP, follow these steps:

1. Clone the forked repository and checkout the `linux-build` branch:
    ```bash
    git clone https://github.com/stevefoy/MultiSpectral-CoRegistration.git
    cd MultiSpectral-CoRegistration
    git checkout linux-branch
    ```

2. Install the necessary dependencies:
    ```bash
    sudo apt-get update
    sudo apt-get install liblapack-dev libopencv-dev cmake
    ```

3. Build Eigen from the provided folder:
    ```bash
    cd eigen
    mkdir build
    cd build
    cmake ..
    make
    sudo make install
    cd ../..
    ```

4. Build the project using the Makefile:
    ```bash
    make
    ```

## Requirements

The code is written in C++17 and was initially tested on Windows using Visual Studio 2019. For the Linux build, the dependencies include:

- **Eigen** (provided in the repository)
- **LAPACK**
- **OpenCV 4.2**
- **OpenMP is Enabled**

## Test Data

A folder containing test data from a Sequoia multi-spectral camera is included in this repository. Below is a sample command line argument to run the test data:

```bash
./multispectral --folder ./test_images/ --model0 5 --model1 0 --model2 0 --model3 0 --model4 0 --model6 0 --imformat TIF --name PointCloud --size 2000 --keep 1 --maxdist 300 --coreg 1
