{
  ament_cmake,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  rosidl_adapter,
  substituteSource,
}:
let
  sources = rec {
    rosidl_parser = substituteSource {
      src = fetchgit {
        name = "rosidl_parser-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "33c663896ccf113e63b6dcc72ca6fcff92e2c8a2";
        hash = "sha256-T8PcZnDv8Eas4NzUgtDCsMA2EB2QSBwfHxCciTyUCQs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_parser";
  version = "4.0.1-1";
  src = sources.rosidl_parser;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.lark rosidl_adapter ];
  buildInputs = [ ament_cmake ];
  propagatedBuildInputs = [ python3Packages.lark rosidl_adapter ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
