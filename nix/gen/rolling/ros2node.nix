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
  rclpy,
  ros2cli,
  substituteSource,
  test_msgs,
}:
let
  sources = rec {
    ros2node = substituteSource {
      src = fetchgit {
        name = "ros2node-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "cda5bbd64f5cf6a992de3f19b3d90de4d731f6f4";
        hash = "sha256-j85eePZAXIeMs2+aueBC8Uo9UrHdffXXeQRHnuf+NAg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2node";
  version = "0.34.0-1";
  src = sources.ros2node;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclpy ros2cli ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
