{
  action_msgs,
  ament_copyright,
  ament_flake8,
  ament_pep257,
  as2_motion_reference_handlers,
  as2_msgs,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geographic_msgs,
  geometry_msgs,
  nav_msgs,
  python3Packages,
  rclpy,
  sensor_msgs,
  std_srvs,
  substituteSource,
}:
let
  sources = rec {
    as2_python_api = substituteSource {
      src = fetchgit {
        name = "as2_python_api-source";
        url = "https://github.com/ros2-gbp/aerostack2-release.git";
        rev = "940180b62e09e7cc7eb59daacf020e478d9b40da";
        hash = "sha256-lMwHAxQQeeWElnKofjTl3sMRf2/RKSYYX7B/NHWWJC4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "as2_python_api";
  version = "1.0.9-1";
  src = sources.as2_python_api;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ action_msgs as2_motion_reference_handlers as2_msgs geographic_msgs geometry_msgs nav_msgs rclpy sensor_msgs std_srvs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
