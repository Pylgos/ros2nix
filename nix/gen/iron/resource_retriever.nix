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
        rev = "eb041057e50165e5e8e0eb98a02c7faee19819b2";
        hash = "sha256-rkBYfjdQoGFm1+1wwXiodEPbQUInVehpNe1Y2ua6h/8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "resource_retriever";
  version = "3.2.2-3";
  src = sources.resource_retriever;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [ ament_index_cpp ament_index_python ];
  buildInputs = [  ];
  propagatedBuildInputs = [ libcurl_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
