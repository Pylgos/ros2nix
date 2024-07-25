{
  ament_cmake_core,
  ament_cmake_lint_cmake,
  ament_cmake_test,
  ament_copyright,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_copyright = substituteSource {
      src = fetchgit {
        name = "ament_cmake_copyright-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "359c7c0a2bdcb5474d93ae88a7225c33cbf58c90";
        hash = "sha256-M1ZK9Hrgpmr7bQYPe0+OngitmJUv6sDkH4yZwVX8Iwk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_copyright";
  version = "0.14.3-1";
  src = sources.ament_cmake_copyright;
  nativeBuildInputs = [ ament_cmake_core ];
  propagatedNativeBuildInputs = [ ament_cmake_test ament_copyright ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
