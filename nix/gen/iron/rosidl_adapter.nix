{
  ament_cmake,
  ament_cmake_core,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3,
  python3Packages,
  rosidl_cli,
  substituteSource,
}:
let
  sources = rec {
    rosidl_adapter = substituteSource {
      src = fetchgit {
        name = "rosidl_adapter-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "c978ac3581f6b2cf1552382182c7d9986ed1e925";
        hash = "sha256-t73/RNXqxJwrpxOhr69/hGe3GLs5amvDgTo5w5LapAM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_adapter";
  version = "4.0.1-1";
  src = sources.rosidl_adapter;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake ament_cmake_core python3 buildPackages.python3Packages.empy rosidl_cli ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_cmake ament_cmake_core python3Packages.empy rosidl_cli ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
