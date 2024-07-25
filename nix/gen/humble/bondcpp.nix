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
        rev = "8e4b4113fbaffdb919ad17b828b46c5af2c46ba8";
        hash = "sha256-vN+BWSSgC26THpQn51V6YboLbFTBtuXX7XCU8Kjg9bw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "bondcpp";
  version = "3.0.2-3";
  src = sources.bondcpp;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ pkg-config ];
  buildInputs = [  ];
  propagatedBuildInputs = [ bond rclcpp rclcpp_lifecycle smclib util-linux ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
