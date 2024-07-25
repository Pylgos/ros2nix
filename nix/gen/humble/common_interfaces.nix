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
        rev = "e3445d5c86e116fe9801ed2ac68837ddbba19600";
        hash = "sha256-+wys61vTGMAhr1KpTXTzCG2ftDqA+X8n1290wqm2BE0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "common_interfaces";
  version = "4.2.4-1";
  src = sources.common_interfaces;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ actionlib_msgs builtin_interfaces diagnostic_msgs geometry_msgs nav_msgs sensor_msgs shape_msgs std_msgs std_srvs stereo_msgs trajectory_msgs visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
