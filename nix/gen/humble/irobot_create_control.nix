{
  ament_cmake,
  ament_cmake_flake8,
  ament_cmake_lint_cmake,
  ament_cmake_pep257,
  ament_cmake_xmllint,
  ament_lint_auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joint_state_broadcaster,
  ros2_controllers,
  ros2launch,
  rsl,
  substituteSource,
}:
let
  sources = rec {
    irobot_create_control = substituteSource {
      src = fetchgit {
        name = "irobot_create_control-source";
        url = "https://github.com/ros2-gbp/create3_sim-release.git";
        rev = "133e0cb689065a272c7f8fca52d362dadef11b06";
        hash = "sha256-4EGzA1GQURUd0AucWXu2taIdB+quxqpL7Ss4jnr9nfs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "irobot_create_control";
  version = "2.1.0-1";
  src = sources.irobot_create_control;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ joint_state_broadcaster ros2_controllers ros2launch rsl ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
