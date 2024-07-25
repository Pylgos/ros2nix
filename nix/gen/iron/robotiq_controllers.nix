{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  controller_interface,
  fetchgit,
  fetchurl,
  fetchzip,
  std_srvs,
  substituteSource,
}:
let
  sources = rec {
    robotiq_controllers = substituteSource {
      src = fetchgit {
        name = "robotiq_controllers-source";
        url = "https://github.com/ros2-gbp/ros2_robotiq_gripper-release.git";
        rev = "f8ce6c0446af1ffca221d62ec6fdb06de2281453";
        hash = "sha256-JhCCmqa9agEkqVO3vJ372AV/ZDF6zTNZta6YYwe29Y8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "robotiq_controllers";
  version = "0.0.1-1";
  src = sources.robotiq_controllers;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ controller_interface std_srvs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
