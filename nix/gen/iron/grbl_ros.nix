{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  grbl_msgs,
  python3Packages,
  rclpy,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    grbl_ros = substituteSource {
      src = fetchgit {
        name = "grbl_ros-source";
        url = "https://github.com/ros2-gbp/grbl_ros-release.git";
        rev = "7c6460f80349cc4b74f6b1bcfbebc79178e94077";
        hash = "sha256-F1t2vcBH6JU+xByKp5lu3SCks+qWKp4ztQ5WkL6N+rI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "grbl_ros";
  version = "0.0.16-6";
  src = sources.grbl_ros;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ grbl_msgs python3Packages.pyserial rclpy std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
