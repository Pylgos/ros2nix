{
  ament_copyright,
  buildPackages,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  substituteSource,
  xacro,
}:
let
  sources = rec {
    webots_ros2_importer = substituteSource {
      src = fetchgit {
        name = "webots_ros2_importer-source";
        url = "https://github.com/ros2-gbp/webots_ros2-release.git";
        rev = "5a1fcefbfe3eeb6614a6989716245d2430ac696c";
        hash = "sha256-M/JdzeCXvGMd8XJ+mMAROFdB9/DI3PB0yLEp/2WaiBg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "webots_ros2_importer";
  version = "2023.1.2-1";
  src = sources.webots_ros2_importer;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.lark ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces python3Packages.pycollada xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
