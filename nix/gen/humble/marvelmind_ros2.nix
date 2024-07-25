{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  launch_xml,
  marvelmind_ros2_msgs,
  rclcpp,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    marvelmind_ros2 = substituteSource {
      src = fetchgit {
        name = "marvelmind_ros2-source";
        url = "https://github.com/MarvelmindRobotics/marvelmind_ros2_release_repo.git";
        rev = "f5243153674e8b6436ce782132324c20f7749a9a";
        hash = "sha256-y3ZRvRsPpSKa+ONhSFIzX4WMfAGM/ovH9duWiEKTk0I=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "marvelmind_ros2";
  version = "1.0.3-5";
  src = sources.marvelmind_ros2;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ launch_xml ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs marvelmind_ros2_msgs rclcpp std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
