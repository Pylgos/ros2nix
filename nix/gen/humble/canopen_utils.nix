{
  ament_lint_auto,
  buildRosPackage,
  canopen_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle_msgs,
  rclpy,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    canopen_utils = substituteSource {
      src = fetchgit {
        name = "canopen_utils-source";
        url = "https://github.com/ros2-gbp/ros2_canopen-release.git";
        rev = "206abf40891a213d509cc46a5c573a040814428a";
        hash = "sha256-eXaYsaKU4utBY4dxWoRhx/qzKUHVQIrwH++Pd8k72Hc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "canopen_utils";
  version = "0.2.11-2";
  src = sources.canopen_utils;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ canopen_interfaces lifecycle_msgs rclpy std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
