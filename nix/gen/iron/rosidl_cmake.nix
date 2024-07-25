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
        rev = "286067fb16409a64750a89edf638e1320a191fad";
        hash = "sha256-lfVyrVOffhZ3ABKkJjjhZbEPdm5q8PLn6jIfT1FilnY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_cmake";
  version = "4.0.1-1";
  src = sources.rosidl_cmake;
  nativeBuildInputs = [ ament_cmake_python ];
  propagatedNativeBuildInputs = [ ament_cmake buildPackages.python3Packages.empy rosidl_pycommon ];
  buildInputs = [ ament_cmake_python ];
  propagatedBuildInputs = [ ament_cmake python3Packages.empy rosidl_pycommon ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
