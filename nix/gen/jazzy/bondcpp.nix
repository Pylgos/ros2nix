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
        rev = "5d1cd97ca5849587ac2763330b3841445d886e87";
        hash = "sha256-fbNSgNmnnRCTFEsui9H+C9BJOcZyqF8Cv6sZjP+89qo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "bondcpp";
  version = "4.1.0-1";
  src = sources.bondcpp;
  nativeBuildInputs = [ ament_cmake pkg-config ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ bond rclcpp rclcpp_lifecycle smclib util-linux ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}