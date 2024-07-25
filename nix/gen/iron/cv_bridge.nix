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
  rclcpp,
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
        rev = "f65382b65093b2b3dd7a39ac2d75e21e9732292a";
        hash = "sha256-Koo3n30JOsC8plnKaHcdnCmU0amJ3WtmGvwOa/AotHg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "cv_bridge";
  version = "3.5.0-1";
  src = sources.cv_bridge;
  nativeBuildInputs = [ ament_cmake_ros python_cmake_module ];
  propagatedNativeBuildInputs = [ ament_index_python buildPackages.python3Packages.numpy ];
  buildInputs = [  ];
  propagatedBuildInputs = [ opencv python3Packages.boost python3Packages.opencv4 rclcpp rcpputils sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
