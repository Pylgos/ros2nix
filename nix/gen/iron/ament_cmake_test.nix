{
  ament_cmake_core,
  ament_cmake_python,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_test = substituteSource {
      src = fetchgit {
        name = "ament_cmake_test-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "ad53ff61458a09f4e0c810b60bd87f87d5d28d47";
        hash = "sha256-WhDW71+NtEzud6mXhr88Don66pLMq+9NoO9h3OAtF4k=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_test";
  version = "2.0.5-1";
  src = sources.ament_cmake_test;
  nativeBuildInputs = [ ament_cmake_python ];
  propagatedNativeBuildInputs = [ ament_cmake_core ];
  buildInputs = [ ament_cmake_python ];
  propagatedBuildInputs = [ ament_cmake_core ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
