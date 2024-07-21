{
  ament_cmake,
  ament_cmake_python,
  ament_lint_auto,
  ament_lint_common,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  rosidl_pycommon,
  substituteSource,
}:
let
  sources = rec {
    rosidl_cmake = substituteSource {
      src = fetchgit {
        name = "rosidl_cmake-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "afb2bd78ca34ec39997c21e46fb871282a1e10fe";
        hash = "sha256-ViES5VI+AC1X3x0SsH13umc4X6Oo+WqUm/V5tOoTHaU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_cmake";
  version = "4.6.3-1";
  src = sources.rosidl_cmake;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake ament_cmake_python buildPackages.python3Packages.empy rosidl_pycommon ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_cmake ament_cmake_python python3Packages.empy rosidl_pycommon ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
