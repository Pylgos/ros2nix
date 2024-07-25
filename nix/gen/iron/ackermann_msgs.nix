{
  ament_cmake,
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
    ackermann_msgs = substituteSource {
      src = fetchgit {
        name = "ackermann_msgs-source";
        url = "https://github.com/ros2-gbp/ackermann_msgs-release.git";
        rev = "4d889f1069371727588d61839a0dbead3c1a614a";
        hash = "sha256-zn0jbHQ6PrAlpzAwpr3Tu01dOE8TVcs0XYlTXL0x8wg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ackermann_msgs";
  version = "2.0.2-5";
  src = sources.ackermann_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
