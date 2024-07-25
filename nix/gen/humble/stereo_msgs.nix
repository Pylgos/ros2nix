{
  ament_cmake,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  sensor_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    stereo_msgs = substituteSource {
      src = fetchgit {
        name = "stereo_msgs-source";
        url = "https://github.com/ros2-gbp/common_interfaces-release.git";
        rev = "645a1c75ab6da3718df296ab02ad76f78488ec10";
        hash = "sha256-1qFDimHY0CBJ+j66AJHNGxrHGOZ0wnROs7qMkNmKFE4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "stereo_msgs";
  version = "4.2.4-1";
  src = sources.stereo_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime sensor_msgs std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
