{
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    open3d_conversions = substituteSource {
      src = fetchgit {
        name = "open3d_conversions-source";
        url = "https://github.com/ros2-gbp/perception_open3d-release.git";
        rev = "abb156ecaeea530e1827480b0aa5245736087e3b";
        hash = "sha256-2yLd7YouJNPhz5sMosuBimTluyfrkn3i5GnxpgpaLeQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "open3d_conversions";
  version = "0.2.1-1";
  src = sources.open3d_conversions;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen rclcpp sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
