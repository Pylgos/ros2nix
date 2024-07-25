{
  ament_copyright,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  rclpy,
  substituteSource,
  webots_ros2_driver,
}:
let
  sources = rec {
    webots_ros2_mavic = substituteSource {
      src = fetchgit {
        name = "webots_ros2_mavic-source";
        url = "https://github.com/ros2-gbp/webots_ros2-release.git";
        rev = "ebae6ac170dc68c175469e7fa0dc8336e6275389";
        hash = "sha256-bnvjSJHn0EQjiG7e82YYPx0NT3izcAePZyH/m41jsCw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "webots_ros2_mavic";
  version = "2023.1.2-1";
  src = sources.webots_ros2_mavic;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rclpy webots_ros2_driver ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
