{
  ament_cmake_auto,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  octomap,
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
        rev = "f448d9b9d109727b979531acf8bfb1a8ef46592e";
        hash = "sha256-RD+gwS31k6UPEKegLdv6kSOha4ju5W2T5EwCpMkZ5Lc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "octomap_ros";
  version = "0.4.3-4";
  src = sources.octomap_ros;
  nativeBuildInputs = [ ament_cmake_auto ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ octomap octomap_msgs sensor_msgs tf2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
