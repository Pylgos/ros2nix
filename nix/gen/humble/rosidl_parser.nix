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
        rev = "1053e51a06309d2bed8245ad84f1f32fd5e0111b";
        hash = "sha256-pkFHJTQj7oyTDBciTnaj3KNFhbEC0H3uIH4e1nRlG0c=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_parser";
  version = "3.1.5-2";
  src = sources.rosidl_parser;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.lark rosidl_adapter ];
  buildInputs = [ ament_cmake ];
  propagatedBuildInputs = [ python3Packages.lark rosidl_adapter ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
