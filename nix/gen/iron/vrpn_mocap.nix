{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  eigen,
  eigen3_cmake_module,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rclcpp,
  std_msgs,
  substituteSource,
  tf2,
  vrpn,
}:
let
  sources = rec {
    vrpn_mocap = substituteSource {
      src = fetchgit {
        name = "vrpn_mocap-source";
        url = "https://github.com/ros2-gbp/vrpn_mocap-release.git";
        rev = "e3f6482d468cf87b2e642a016d975d4049d95d38";
        hash = "sha256-qTdwB+YAkx59icepyKJgOykWlxF7kMMSSJ/EKm+NVWs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "vrpn_mocap";
  version = "1.1.0-1";
  src = sources.vrpn_mocap;
  nativeBuildInputs = [ ament_cmake eigen3_cmake_module ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen geometry_msgs rclcpp std_msgs tf2 vrpn ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}