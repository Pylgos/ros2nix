{
  ament_cmake,
  ament_lint_auto,
  ament_lint_cmake,
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
    graph_msgs = substituteSource {
      src = fetchgit {
        name = "graph_msgs-source";
        url = "https://github.com/ros2-gbp/graph_msgs-release.git";
        rev = "cb9838e309f09242d2ccef5878756aa50588a063";
        hash = "sha256-Zs/vEflqm3Ft6PVC5rmE7JAj2pPFja8QAhBxSsH93dg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "graph_msgs";
  version = "0.2.0-6";
  src = sources.graph_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}