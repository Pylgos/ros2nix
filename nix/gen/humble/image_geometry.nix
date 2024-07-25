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
        rev = "9e4572e523dd493d437b2eb19222a795dce032b3";
        hash = "sha256-OwPrbVcjCDo2FPbEA8PWpw0R8+f26IVqWu2ntyi3ImU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "image_geometry";
  version = "3.2.1-1";
  src = sources.image_geometry;
  nativeBuildInputs = [ ament_cmake_python ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ opencv sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
