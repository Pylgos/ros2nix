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
  rosidl_adapter,
  rosidl_parser,
  substituteSource,
}:
let
  sources = rec {
    rosidl_cmake = substituteSource {
      src = fetchgit {
        name = "rosidl_cmake-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "9e225fe9e32043dbee0e3ef669e5f756c4cb8dc7";
        hash = "sha256-+VkMubu+KgvK4U5ccEqkfBv8p7t3VQkT4TI0D/7DAso=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_cmake";
  version = "3.1.5-2";
  src = sources.rosidl_cmake;
  nativeBuildInputs = [ ament_cmake_python ];
  propagatedNativeBuildInputs = [ ament_cmake buildPackages.python3Packages.empy rosidl_adapter rosidl_parser ];
  buildInputs = [ ament_cmake_python ];
  propagatedBuildInputs = [ ament_cmake python3Packages.empy rosidl_adapter rosidl_parser ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
