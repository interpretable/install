#!/bin/sh

#download openCV and openCV contrib

echo "-----------------------------------SETUP OPEN_CV"

mkdir opencv
cd opencv
wget https://github.com/opencv/opencv/archive/3.4.0.zip
unzip 3.4.0.zip
rm 3.4.0.zip

wget https://github.com/opencv/opencv_contrib/archive/3.4.0.zip
unzip 3.4.0.zip
rm 3.4.0.zip


# create folder and move compilation file 

mkdir opencv-3.4.0/build
cd opencv-3.4.0/build

cmake .. -DENABLE_FAST_MATH=OFF \
-DOPENCV_EXTRA_MODULES_PATH:PATH="../../opencv_contrib-3.4.0/modules" \
-DBUILD_opencv_ts=ON \
-DBUILD_opencv_xfeatures2d=ON \
-DBUILD_opencv_plot=ON \
-DBUILD_opencv_photo=ON \
-DBUILD_opencv_core=ON \
-DBUILD_opencv_rgbd=ON \
-DBUILD_opencv_features2d=ON \
-DBUILD_opencv_bioinspired=ON \
-DBUILD_opencv_tracking=ON \
-DBUILD_opencv_aruco=OFF \
-DBUILD_opencv_surface_matching=ON \
-DBUILD_opencv_line_descriptor=ON \
-DBUILD_opencv_ximgproc=ON \
-DBUILD_opencv_calib3d=ON \
-DBUILD_opencv_flann=ON \
-DBUILD_opencv_saliency=ON \
-DBUILD_opencv_video=ON \
-DBUILD_opencv_objdetect=ON \
-DBUILD_PROTOBUF=ON  \
-DBUILD_opencv_xobjdetect=ON  \
-DBUILD_opencv_reg=ON  \
-DBUILD_FAT_JAVA_LIB=OFF \
-DBUILD_opencv_ccalib=ON  \
      -DBUILD_SHARED_LIBS=OFF \
      -DBUILD_DOCS=OFF \
      -DBUILD_EXAMPLES=OFF \
      -DBUILD_FAT_JAVA_LIB=OFF \
      -DBUILD_JASPER=OFF \
      -DBUILD_PACKAGE=OFF \
      -DBUILD_opencv_java=OFF \
      -DBUILD_opencv_python=OFF \
      -DBUILD_opencv_apps=OFF \
      -DBUILD_opencv_videoio=OFF \
      -DBUILD_JPEG=OFF \
      -DBUILD_PNG=OFF \
      -DWITH_1394=OFF \
      -DWITH_CARBON=OFF \
      -DWITH_JPEG=OFF \
      -DWITH_PNG=OFF \
      -DWITH_FFMPEG=OFF \
      -DWITH_OPENCL=OFF \
      -DWITH_OPENCLAMDBLAS=OFF \
      -DWITH_OPENCLAMDFFT=OFF \
      -DWITH_GIGEAPI=OFF \
      -DWITH_CUDA=OFF \
      -DWITH_CUFFT=OFF \
      -DWITH_JASPER=OFF \
      -DWITH_LIBV4L=OFF \
      -DWITH_IMAGEIO=OFF \
      -DWITH_IPP=OFF \
      -DWITH_OPENNI=OFF \
      -DWITH_QT=OFF \
      -DWITH_QUICKTIME=OFF \
      -DWITH_V4L=OFF \
      -DWITH_PVAPI=OFF \
      -DWITH_OPENEXR=OFF \
      -DWITH_EIGEN=OFF \
      -DBUILD_TESTS=OFF \
      -DWITH_LAPACK=OFF \
      -DWITH_ITT=OFF \
      -DBUILD_PERF_TESTS=OFF 2>&1

# compile and install 
make -j4
sudo make install