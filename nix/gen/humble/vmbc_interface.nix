{
  ament_cmake_ros,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  substituteSource,
}:
let
  sources = rec {
    vmbc_interface = substituteSource {
      src = fetchgit {
        name = "vmbc_interface-source";
        url = "https://github.com/ros2-gbp/vimbax_ros2_driver-release.git";
        rev = "aa4fb2be68356bedabfcf1c9eec24264174a8d65";
        hash = "sha256-mey/u1w1VIsYjxeRgyoVmubSXKNwfw8XSiR5bOw1wEs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "vmbc_interface";
  version = "1.0.2-1";
  src = sources.vmbc_interface;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
