{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_core_generators,
  rosidl_core_runtime,
  service_msgs,
  substituteSource,
}:
let
  sources = rec {
    type_description_interfaces = substituteSource {
      src = fetchgit {
        name = "type_description_interfaces-source";
        url = "https://github.com/ros2-gbp/rcl_interfaces-release.git";
        rev = "19c6e62afc4dc77010694e911d6f9c64373fa5fc";
        hash = "sha256-xUT46L5yIW2waiOgCH9yky8Mxz/On8iU3u1U4ZFJ5E4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "type_description_interfaces";
  version = "2.0.2-2";
  src = sources.type_description_interfaces;
  nativeBuildInputs = [ ament_cmake rosidl_core_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_core_runtime service_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}