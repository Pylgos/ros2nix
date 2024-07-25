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
        rev = "ac0b1049d88680d635d4a1eb2ebee931010d45a7";
        hash = "sha256-KhDxnVtKRMVnBNWj4iq/F7/FHVBLZZ/xO9KCYI9kDlk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nao_lola";
  version = "0.2.3-1";
  src = sources.nao_lola;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ nao_command_msgs nao_sensor_msgs python3Packages.boost rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
