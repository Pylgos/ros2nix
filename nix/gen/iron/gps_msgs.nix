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
    gps_msgs = substituteSource {
      src = fetchgit {
        name = "gps_msgs-source";
        url = "https://github.com/ros2-gbp/gps_umd-release.git";
        rev = "dc49885a947d919621d32eda34d2497d354e6b95";
        hash = "sha256-+QdXAKoETYEVPixEE9cGbmi8yFtZl1SItOQI9/n3qFI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gps_msgs";
  version = "2.0.4-1";
  src = sources.gps_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
