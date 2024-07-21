{
  ament_cmake,
  ament_cmake_auto,
  ament_cmake_clang_format,
  ament_cmake_copyright,
  ament_cmake_cppcheck,
  ament_cmake_cpplint,
  ament_cmake_flake8,
  ament_cmake_lint_cmake,
  ament_cmake_pep257,
  ament_cmake_ros,
  ament_cmake_xmllint,
  buildRosPackage,
  cmake,
  curl,
  event_camera_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  ffmpeg,
  git,
  glew,
  glfw3,
  gtest,
  hdf5,
  libusb1,
  opencv,
  openscenegraph,
  python3Packages,
  rclcpp,
  rclcpp_components,
  ros_environment,
  std_srvs,
  substituteSource,
  unzip,
  wget,
}:
let
  sources = rec {
    metavision_driver = substituteSource {
      src = fetchgit {
        name = "metavision_driver-source";
        url = "https://github.com/ros2-gbp/metavision_driver-release.git";
        rev = "dff2f1635200cb1b5b3e7f364de82e3d04a771ca";
        hash = "sha256-6YJm1D2gLZgtxGftqG+MCBCzfpJxkonaTl9z9Qz+nVs=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/ros-event-camera/openeb.git";
          to = "URL ${metavision_driver-vendor_source0}";
        }
      ];
    };
    metavision_driver-vendor_source0 = substituteSource {
      src = fetchgit {
        name = "metavision_driver-vendor_source0-source";
        url = "https://github.com/ros-event-camera/openeb.git";
        rev = "db34531b9d0fef952e39f5fef7169e583575b6e9";
        hash = "sha256-QHs3Bz6Mj08Rk8lUAIyWfMwMcoW1XCswASYhX0hfPiM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "metavision_driver";
  version = "1.0.8-3";
  src = sources.metavision_driver;
  nativeBuildInputs = [ ament_cmake ament_cmake_auto ament_cmake_ros cmake curl git ros_environment unzip wget ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ event_camera_msgs ffmpeg glew glfw3 hdf5 libusb1 opencv openscenegraph python3Packages.boost rclcpp rclcpp_components std_srvs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
