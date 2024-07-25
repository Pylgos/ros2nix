{
  action_msgs,
  ament_copyright,
  ament_flake8,
  ament_index_python,
  ament_pep257,
  ament_xmllint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch_testing,
  launch_testing_ros,
  python3Packages,
  rclpy,
  ros2cli,
  rosidl_runtime_py,
  substituteSource,
  test_msgs,
}:
let
  sources = rec {
    ros2action = substituteSource {
      src = fetchgit {
        name = "ros2action-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "21ee079cc832134f8b79f818083f6547ae78da74";
        hash = "sha256-JtrbP/+PXSn/Ah/N+iTX3nrqEiuK10SeDizvPNajTcI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2action";
  version = "0.18.10-1";
  src = sources.ros2action;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_index_python ];
  buildInputs = [  ];
  propagatedBuildInputs = [ action_msgs rclpy ros2cli rosidl_runtime_py ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
