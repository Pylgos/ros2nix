{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  libspnav,
  rclcpp,
  rclcpp_components,
  sensor_msgs,
  spacenavd,
  substituteSource,
}:
let
  sources = rec {
    spacenav = substituteSource {
      src = fetchgit {
        name = "spacenav-source";
        url = "https://github.com/ros2-gbp/joystick_drivers-release.git";
        rev = "bef70e4ac0d2fe718aff184932115a9e9e7bff20";
        hash = "sha256-5WXkdmHcAdaPaMSMNcTfScbDq9VNmFSb7jofUAAHyAk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "spacenav";
  version = "3.3.0-1";
  src = sources.spacenav;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs libspnav rclcpp rclcpp_components sensor_msgs spacenavd ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
