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
        rev = "b8d030d40febf9e5b6a338ab78471e57682d3c4a";
        hash = "sha256-VwQaQ1RxDY6NO5ZZk4CdkeTkBC60WhAP+nBKX7z/DZM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "resource_retriever";
  version = "3.4.3-1";
  src = sources.resource_retriever;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake_ros ament_index_python ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_cpp libcurl_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
