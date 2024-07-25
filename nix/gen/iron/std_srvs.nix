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
    std_srvs = substituteSource {
      src = fetchgit {
        name = "std_srvs-source";
        url = "https://github.com/ros2-gbp/common_interfaces-release.git";
        rev = "02af571c75994df7f45acb0846091096db3e36fd";
        hash = "sha256-GStmbLosdOgOlPGJxhSqVgorA/5hP47d2RdfxBTNUBM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "std_srvs";
  version = "5.0.1-1";
  src = sources.std_srvs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
