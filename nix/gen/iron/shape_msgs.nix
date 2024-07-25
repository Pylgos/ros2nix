{
  ament_cmake,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    shape_msgs = substituteSource {
      src = fetchgit {
        name = "shape_msgs-source";
        url = "https://github.com/ros2-gbp/common_interfaces-release.git";
        rev = "2e3de94b882bf4471916389ce5fdd1fb6dd75439";
        hash = "sha256-ZCSsNv/bMN8mtKqoptKi2a6NaWNQDu+FdXbzMjboWEo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "shape_msgs";
  version = "5.0.1-1";
  src = sources.shape_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
