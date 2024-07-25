{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rosidl_default_generators,
  rosidl_default_runtime,
  soccer_geometry_msgs,
  soccer_vision_attribute_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    soccer_model_msgs = substituteSource {
      src = fetchgit {
        name = "soccer_model_msgs-source";
        url = "https://github.com/ros2-gbp/soccer_interfaces-release.git";
        rev = "2475cd4c3a25fc431e1e18b26b2815a024f8adf0";
        hash = "sha256-3TkRNFJMgOc3ceh857nj9/dqwx2n2KkyxR7qMB5IwQI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "soccer_model_msgs";
  version = "0.3.0-1";
  src = sources.soccer_model_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs rosidl_default_runtime soccer_geometry_msgs soccer_vision_attribute_msgs std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
