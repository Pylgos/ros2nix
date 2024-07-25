{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  as2_motion_reference_handlers,
  as2_python_api,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  rclpy,
  substituteSource,
}:
let
  sources = rec {
    as2_keyboard_teleoperation = substituteSource {
      src = fetchgit {
        name = "as2_keyboard_teleoperation-source";
        url = "https://github.com/ros2-gbp/aerostack2-release.git";
        rev = "dc8e05b57d8e648c5362238354a26fcbe81ec2a1";
        hash = "sha256-p32c6Mq08n1UWMxuRCG56pLqbabj2uKlgMeBVAPeUYo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "as2_keyboard_teleoperation";
  version = "1.0.9-1";
  src = sources.as2_keyboard_teleoperation;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ as2_motion_reference_handlers as2_python_api rclpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
