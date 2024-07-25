{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclpy,
  rmf_fleet_msgs,
  substituteSource,
}:
let
  sources = rec {
    rmf_charging_schedule = substituteSource {
      src = fetchgit {
        name = "rmf_charging_schedule-source";
        url = "https://github.com/ros2-gbp/rmf_ros2-release.git";
        rev = "6a140eac4ac96404b730412d8806d058a3b1e16c";
        hash = "sha256-kJ06DwFEpf/rcvO7oVqAxRBqKHumUNCvmbwxW/y7YSo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_charging_schedule";
  version = "2.2.5-1";
  src = sources.rmf_charging_schedule;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclpy rmf_fleet_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
