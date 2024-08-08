CXX := g++
CXXFLAGS := -Wall -Wextra -std=c++17 -fopenmp -g -fdiagnostics-color=always

# Include directories
INCLUDE_DIRS := -I./Eigen -I./MultiSpectral -I/usr/include/opencv4

# Library directories and dependencies
LIB_DIRS := -L/usr/lib
LIBS := -llapacke -llapack -lblas -lopencv_core -lopencv_imgcodecs -lopencv_imgproc -lopencv_highgui -lopencv_photo

# Source and header files
SRCS := MultiSpectral/CameraParam.cpp MultiSpectral/Coregistration.cpp MultiSpectral/descriptor.cpp MultiSpectral/elas.cpp MultiSpectral/Elas_process.cpp MultiSpectral/filter.cpp MultiSpectral/ImageGeometry.cpp MultiSpectral/matrix.cpp MultiSpectral/PointCloud.cpp MultiSpectral/Rectifier.cpp MultiSpectral/Source.cpp MultiSpectral/triangle.cpp
HDRS := MultiSpectral/Coregistration.h MultiSpectral/cxxopts.hpp MultiSpectral/descriptor.h MultiSpectral/elas.h MultiSpectral/filter.h MultiSpectral/image.h MultiSpectral/matrix.h MultiSpectral/triangle.h

# Object files
OBJS := $(SRCS:.cpp=.o)

# Target executable
TARGET := multispectral

# Default target
all: $(TARGET)

# Link the object files to create the executable
$(TARGET): $(OBJS)
	@echo "Linking object files..."
	$(CXX) $(CXXFLAGS) $(LIB_DIRS) -o $@ $^ $(LIBS)

# Compile the .cpp files to .o files
%.o: %.cpp $(HDRS)
	@echo "Compiling $<..."
	$(CXX) $(CXXFLAGS) $(INCLUDE_DIRS) -c $< -o $@

# Clean up the project directory
clean:
	rm -f $(OBJS) $(TARGET)

# Phony targets
.PHONY: all clean
