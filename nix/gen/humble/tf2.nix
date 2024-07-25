{
  ament_cmake,
  ament_cmake_copyright,
  ament_cmake_cppcheck,
  ament_cmake_cpplint,
  ament_cmake_google_benchmark,
  ament_cmake_gtest,
  ament_cmake_lint_cmake,
  ament_cmake_uncrustify,
  ament_cmake_xmllint,
  buildRosPackage,
  builtin_interfaces,
  console-bridge,
  console_bridge_vendor,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rcutils,
  rosidl_runtime_cpp,
  substituteSource,
}:
let
  sources = rec {
    tf2 = substituteSource {
      src = fetchgit {
        name = "tf2-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "65098ec8af1c583d3ebf7cbb5b93abc873f776e4";
        hash = "sha256-mQBJwPu9JGRiQLPov6c3TiGCZ7evlxZU/gmIBdJzs70=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tf2";
  version = "0.25.7-1";
  src = sources.tf2;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces console-bridge console_bridge_vendor geometry_msgs rcutils rosidl_runtime_cpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
