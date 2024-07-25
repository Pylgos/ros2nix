{
  ament_cmake,
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
    four_wheel_steering_msgs = substituteSource {
      src = fetchgit {
        name = "four_wheel_steering_msgs-source";
        url = "https://github.com/ros2-gbp/four_wheel_steering_msgs-release.git";
        rev = "eb7c7af86d9050f176759509c5bd4e2e48dbda9d";
        hash = "sha256-lESkZ6d2jUSfCCCB5KsV8gJwBTO0EG7O4/LInYggSzc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "four_wheel_steering_msgs";
  version = "2.0.1-3";
  src = sources.four_wheel_steering_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
