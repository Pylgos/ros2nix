{
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  console-bridge,
  console_bridge_vendor,
  fetchgit,
  fetchurl,
  fetchzip,
  rcpputils,
  substituteSource,
}:
let
  sources = rec {
    class_loader = substituteSource {
      src = fetchgit {
        name = "class_loader-source";
        url = "https://github.com/ros2-gbp/class_loader-release.git";
        rev = "3812dadf48b00ed1b3d9957c50ddb2741bd447b7";
        hash = "sha256-V+6oUSK7M95ihfg1lxWWhZG258UL04cmtUGoh/eQqOI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "class_loader";
  version = "2.8.0-1";
  src = sources.class_loader;
  nativeBuildInputs = [ ament_cmake ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ console-bridge console_bridge_vendor rcpputils ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
