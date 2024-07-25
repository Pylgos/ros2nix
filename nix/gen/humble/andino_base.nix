{
  ament_cmake,
  ament_cmake_clang_format,
  buildRosPackage,
  controller_manager,
  fetchgit,
  fetchurl,
  fetchzip,
  gflags,
  hardware_interface,
  joint_state_broadcaster,
  pkg-config,
  pluginlib,
  rclcpp,
  rclcpp_lifecycle,
  substituteSource,
}:
let
  sources = rec {
    andino_base = substituteSource {
      src = fetchgit {
        name = "andino_base-source";
        url = "https://github.com/ros2-gbp/andino-release.git";
        rev = "2bd7e9c53774b053454e3c360e4d7a84750e571f";
        hash = "sha256-BPydOk6iIN/AuSK+Qz5c/K2/V/Nrve8LU4+0bs+XEbs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "andino_base";
  version = "0.1.0-1";
  src = sources.andino_base;
  nativeBuildInputs = [ ament_cmake pkg-config ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ controller_manager gflags hardware_interface joint_state_broadcaster pluginlib rclcpp rclcpp_lifecycle ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
