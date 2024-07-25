{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  ament_xmllint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch_ros,
  launch_testing,
  launch_testing_ros,
  python3Packages,
  rcl_interfaces,
  rclpy,
  ros2cli,
  ros2node,
  ros2service,
  substituteSource,
}:
let
  sources = rec {
    ros2param = substituteSource {
      src = fetchgit {
        name = "ros2param-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "b3bda5664b7c8226eabdf43e24db127b9216bc09";
        hash = "sha256-PEppNdctwcDlRYl8y4daulfgghYjyR38J9IycUB8Tp8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2param";
  version = "0.34.0-1";
  src = sources.ros2param;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rcl_interfaces rclpy ros2cli ros2node ros2service ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
