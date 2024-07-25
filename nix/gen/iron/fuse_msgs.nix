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
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    fuse_msgs = substituteSource {
      src = fetchgit {
        name = "fuse_msgs-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
        rev = "0c4f0216c81ffa63cd2cd13fb6f48606a2189905";
        hash = "sha256-O3/U0dy1e+uRJ2/6yBJ4VmygSdgT4gNtomG/5g/jr5g=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "fuse_msgs";
  version = "1.0.1-4";
  src = sources.fuse_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
