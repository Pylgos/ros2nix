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
    apriltag_msgs = substituteSource {
      src = fetchgit {
        name = "apriltag_msgs-source";
        url = "https://github.com/ros2-gbp/apriltag_msgs-release.git";
        rev = "33320cbd9bdfa147b2397b73af1db276ffdb97a6";
        hash = "sha256-8gmaJqHmANuH5XDGCZ8C29KjCY7QKQ8r2DSpl1jxp20=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "apriltag_msgs";
  version = "2.0.1-2";
  src = sources.apriltag_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
