{
  actionlib_msgs,
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  diagnostic_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  nav_msgs,
  sensor_msgs,
  shape_msgs,
  std_msgs,
  std_srvs,
  stereo_msgs,
  substituteSource,
  trajectory_msgs,
  visualization_msgs,
}:
let
  sources = rec {
    common_interfaces = substituteSource {
      src = fetchgit {
        name = "common_interfaces-source";
        url = "https://github.com/ros2-gbp/common_interfaces-release.git";
        rev = "f23f9cec21cffa31a0bc37d7c0cae452d27dbd70";
        hash = "sha256-JTPAmmmebDV+xC3HwbmpM/Zjafsdo6V/qaPszLes0Do=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "common_interfaces";
  version = "5.0.1-1";
  src = sources.common_interfaces;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ actionlib_msgs builtin_interfaces diagnostic_msgs geometry_msgs nav_msgs sensor_msgs shape_msgs std_msgs std_srvs stereo_msgs trajectory_msgs visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
