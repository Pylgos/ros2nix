{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rclpy,
  substituteSource,
}:
let
  sources = rec {
    teleop_twist_keyboard = substituteSource {
      src = fetchgit {
        name = "teleop_twist_keyboard-source";
        url = "https://github.com/ros2-gbp/teleop_twist_keyboard-release.git";
        rev = "ef5f09a61f8f264b04814a0e2d2f596da85eb27d";
        hash = "sha256-RIp2xSUZdrlSj/8rUnbFawM86Cz5qYfDOhW28D0mr3Q=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "teleop_twist_keyboard";
  version = "2.4.0-1";
  src = sources.teleop_twist_keyboard;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs rclpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}