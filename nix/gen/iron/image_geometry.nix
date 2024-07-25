{
  ament_cmake_gtest,
  ament_cmake_pytest,
  ament_cmake_python,
  ament_cmake_ros,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  opencv,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    image_geometry = substituteSource {
      src = fetchgit {
        name = "image_geometry-source";
        url = "https://github.com/ros2-gbp/vision_opencv-release.git";
        rev = "158e84cd02a4276b397aaf8c785d94dc40618ac1";
        hash = "sha256-OybIwfypXigo61vogCmeF+L6SgPRhXY/oF5Bpd00bI4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "image_geometry";
  version = "3.5.0-1";
  src = sources.image_geometry;
  nativeBuildInputs = [ ament_cmake_python ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ opencv sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
