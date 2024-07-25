{
  ament_cmake_gtest,
  ament_cmake_pytest,
  ament_cmake_ros,
  ament_index_python,
  ament_lint_auto,
  ament_lint_common,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  opencv,
  python3Packages,
  python_cmake_module,
  rcpputils,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    cv_bridge = substituteSource {
      src = fetchgit {
        name = "cv_bridge-source";
        url = "https://github.com/ros2-gbp/vision_opencv-release.git";
        rev = "60cdf474334fe326efc60de14b0f150ec4844b97";
        hash = "sha256-hrhmEchLEAyY7EsU0zS2npW3tH7c0nkIHp6Wds1WbyM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "cv_bridge";
  version = "3.2.1-1";
  src = sources.cv_bridge;
  nativeBuildInputs = [ ament_cmake_ros python_cmake_module ];
  propagatedNativeBuildInputs = [ ament_index_python buildPackages.python3Packages.numpy ];
  buildInputs = [  ];
  propagatedBuildInputs = [ opencv python3Packages.boost python3Packages.opencv4 rcpputils sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
