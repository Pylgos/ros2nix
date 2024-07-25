{
  ament_cmake,
  ament_cmake_gmock,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  pybind11_vendor,
  python_cmake_module,
  substituteSource,
  yaml_cpp_vendor,
}:
let
  sources = rec {
    caret_analyze_cpp_impl = substituteSource {
      src = fetchgit {
        name = "caret_analyze_cpp_impl-source";
        url = "https://github.com/ros2-gbp/caret_analyze_cpp_impl-release.git";
        rev = "ac598f3f19bf8b93fd132ce73ccea4462639cb76";
        hash = "sha256-Cl4nLemRGQwl+ggu2uetpTD3n8t1r8v/NTDjdTGYwdo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "caret_analyze_cpp_impl";
  version = "0.5.0-5";
  src = sources.caret_analyze_cpp_impl;
  nativeBuildInputs = [ ament_cmake python_cmake_module ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ pybind11_vendor yaml_cpp_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
