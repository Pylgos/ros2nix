{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  ament_xmllint,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  rclpy,
  ros2cli,
  rosidl_runtime_py,
  substituteSource,
  test_msgs,
}:
let
  sources = rec {
    ros2acceleration = substituteSource {
      src = fetchgit {
        name = "ros2acceleration-source";
        url = "https://github.com/ros2-gbp/ros2acceleration-release.git";
        rev = "081baee270d7850baf64902ae109b7429516bbfb";
        hash = "sha256-DRkaUv6JAKKbX1+DqnpK8wTDm1+jlEoHal/0i6rhA6I=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2acceleration";
  version = "0.5.1-3";
  src = sources.ros2acceleration;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.numpy buildPackages.python3Packages.pyyaml ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclpy ros2cli rosidl_runtime_py ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
