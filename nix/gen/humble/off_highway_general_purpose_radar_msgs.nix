{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    off_highway_general_purpose_radar_msgs = substituteSource {
      src = fetchgit {
        name = "off_highway_general_purpose_radar_msgs-source";
        url = "https://github.com/ros2-gbp/off_highway_sensor_drivers-release.git";
        rev = "675de055ef0f661825523bc72e7fed356fdf06dd";
        hash = "sha256-MnXMNgeTF0T+YogMJHkfA/ND42gegjSi8zq2qhEn3sE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "off_highway_general_purpose_radar_msgs";
  version = "0.6.2-1";
  src = sources.off_highway_general_purpose_radar_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
