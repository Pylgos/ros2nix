{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  rclpy,
  std_msgs,
  substituteSource,
  trajectory_msgs,
}:
let
  sources = rec {
    qb_device_test_controllers = substituteSource {
      src = fetchgit {
        name = "qb_device_test_controllers-source";
        url = "https://bitbucket.org/qbrobotics/qbdevice-ros2-release.git";
        rev = "35d3efddba28dfce58527351ba131ee2472d26b7";
        hash = "sha256-/G5g5E8TBQXqgs+AQQDd+FYD00v9Fh/NjsdLJXU872k=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "qb_device_test_controllers";
  version = "4.1.3-1";
  src = sources.qb_device_test_controllers;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclpy std_msgs trajectory_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
