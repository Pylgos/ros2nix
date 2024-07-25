{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  nao_command_msgs,
  nao_sensor_msgs,
  python3Packages,
  rclcpp,
  substituteSource,
}:
let
  sources = rec {
    nao_lola = substituteSource {
      src = fetchgit {
        name = "nao_lola-source";
        url = "https://github.com/ros2-gbp/nao_lola-release.git";
        rev = "ebf22a304bfd7229e34ccd77659973634946bacb";
        hash = "sha256-jjfzIZ3bh6LvAWHCtnX+BGSJ1pJBEIEfnSjbBSSbNfY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nao_lola";
  version = "0.1.3-1";
  src = sources.nao_lola;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ nao_command_msgs nao_sensor_msgs python3Packages.boost rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
