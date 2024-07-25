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
        rev = "703aa0fc8d80c67f488253b2a4e574bbd93757a2";
        hash = "sha256-y4DJ9zOSPtaMJqyHbcxWEc8zhZkKGJwDlT8xyVy114A=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "image_geometry";
  version = "4.1.0-1";
  src = sources.image_geometry;
  nativeBuildInputs = [ ament_cmake_python ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ opencv sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}