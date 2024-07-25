{
  ament_cmake,
  buildRosPackage,
  builtin_interfaces,
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
    metro_benchmark_msgs = substituteSource {
      src = fetchgit {
        name = "metro_benchmark_msgs-source";
        url = "https://github.com/ros2-gbp/metrics_msgs-release.git";
        rev = "ab126a1fbe5a0b1144a3d9c4876efdf79c2da310";
        hash = "sha256-IibKYo4coLXb0qHUZfogDC9ljP8aSzyuXb9ul9nmVNE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "metro_benchmark_msgs";
  version = "0.1.1-1";
  src = sources.metro_benchmark_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
