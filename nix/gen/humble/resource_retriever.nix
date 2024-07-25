{
  ament_cmake_gtest,
  ament_cmake_pytest,
  ament_cmake_ros,
  ament_index_cpp,
  ament_index_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  libcurl_vendor,
  python3Packages,
  python_cmake_module,
  substituteSource,
}:
let
  sources = rec {
    resource_retriever = substituteSource {
      src = fetchgit {
        name = "resource_retriever-source";
        url = "https://github.com/ros2-gbp/resource_retriever-release.git";
        rev = "e57e2726ce8d4dde0375ce64bc0af1b82d58b3c2";
        hash = "sha256-iaYRjZI4J5gTKIkitZ+omBcBqd45x33VL72P7eeG2D4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "resource_retriever";
  version = "3.1.2-1";
  src = sources.resource_retriever;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [ ament_index_cpp ament_index_python ];
  buildInputs = [  ];
  propagatedBuildInputs = [ libcurl_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
