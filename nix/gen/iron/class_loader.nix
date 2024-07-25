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
        rev = "94073d2aa859331f1ddc82336f7b873804c1d5cb";
        hash = "sha256-HtcYovEKRbZmGQOyGdDJnSjoGxgV+oGalFI97cLbkZg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "class_loader";
  version = "2.5.0-4";
  src = sources.class_loader;
  nativeBuildInputs = [ ament_cmake ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ console-bridge console_bridge_vendor rcpputils ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
