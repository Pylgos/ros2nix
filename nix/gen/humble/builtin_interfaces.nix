{
  ament_cmake,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    builtin_interfaces = substituteSource {
      src = fetchgit {
        name = "builtin_interfaces-source";
        url = "https://github.com/ros2-gbp/rcl_interfaces-release.git";
        rev = "3f312e522480d0cb376403a7ce368a5c0fea2436";
        hash = "sha256-whOcCMxa6gQJM0o3BZYY9GpEzg7g2svk2+whrmFk8bg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "builtin_interfaces";
  version = "1.2.1-1";
  src = sources.builtin_interfaces;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
