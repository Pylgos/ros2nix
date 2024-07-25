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
        rev = "a0cc6a28fcf25449556885b85c3adbc7d4f8443c";
        hash = "sha256-daVbzkdjqkFjDZGoXPeiAANPal6+PeI7kd+uZimtNZU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "std_srvs";
  version = "4.2.4-1";
  src = sources.std_srvs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
