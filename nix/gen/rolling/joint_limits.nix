{
  ament_cmake,
  ament_cmake_gen_version_h,
  ament_cmake_gtest,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch_ros,
  launch_testing_ament_cmake,
  rclcpp,
  rclcpp_lifecycle,
  substituteSource,
  urdf,
}:
let
  sources = rec {
    joint_limits = substituteSource {
      src = fetchgit {
        name = "joint_limits-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "b997189d7e1fb00462ae7c4e11609aacff0e68f4";
        hash = "sha256-3gLSlxnFS9ouot8EWHBX40rV0Hpa61f02ijD6NvlUPs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "joint_limits";
  version = "4.12.0-1";
  src = sources.joint_limits;
  nativeBuildInputs = [ ament_cmake ament_cmake_gen_version_h ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp rclcpp_lifecycle urdf ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
