{
  ament_cmake_auto,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  octomap_msgs,
  sensor_msgs,
  substituteSource,
  tf2,
}:
let
  sources = rec {
    octomap_ros = substituteSource {
      src = fetchgit {
        name = "octomap_ros-source";
        url = "https://github.com/ros2-gbp/octomap_ros-release.git";
        rev = "7d7d6602efcb9b41b4ffa16e6bf9cd7da0ae1dc6";
        hash = "sha256-O2xNJ++3IWtObx9amtFyVhAFiV1CMHlVbRq43ZawhE0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "octomap_ros";
  version = "0.4.4-1";
  src = sources.octomap_ros;
  nativeBuildInputs = [ ament_cmake_auto ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ octomap_msgs sensor_msgs tf2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}