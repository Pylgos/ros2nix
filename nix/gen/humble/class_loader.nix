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
        rev = "05674e2b1bb64a95c895ac4000b8284be949c562";
        hash = "sha256-0kZHPHqah+t7yQ+myAaXmOQRUjF7ctFl9iWRWtbrvyw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "class_loader";
  version = "2.2.0-3";
  src = sources.class_loader;
  nativeBuildInputs = [ ament_cmake ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ console-bridge console_bridge_vendor rcpputils ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
