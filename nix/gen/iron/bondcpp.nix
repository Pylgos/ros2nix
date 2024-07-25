{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  bond,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  pkg-config,
  rclcpp,
  rclcpp_lifecycle,
  smclib,
  substituteSource,
  util-linux,
}:
let
  sources = rec {
    bondcpp = substituteSource {
      src = fetchgit {
        name = "bondcpp-source";
        url = "https://github.com/ros2-gbp/bond_core-release.git";
        rev = "ef22d878c0502dd187f87c209be8d19995fbb47e";
        hash = "sha256-wy3kCL86JrjYj9NSdQSoElNk2Av00ERKHmxi5+16hNU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "bondcpp";
  version = "4.0.0-4";
  src = sources.bondcpp;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ pkg-config ];
  buildInputs = [  ];
  propagatedBuildInputs = [ bond rclcpp rclcpp_lifecycle smclib util-linux ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
