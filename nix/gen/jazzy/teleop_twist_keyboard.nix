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
        rev = "4a7be17b9cce71cb672485fb1e0afecf3bba628f";
        hash = "sha256-RIp2xSUZdrlSj/8rUnbFawM86Cz5qYfDOhW28D0mr3Q=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "teleop_twist_keyboard";
  version = "2.4.0-2";
  src = sources.teleop_twist_keyboard;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs rclpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}