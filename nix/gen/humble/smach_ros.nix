{
  ament_cmake,
  ament_cmake_python,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclpy,
  smach,
  smach_msgs,
  std_msgs,
  std_srvs,
  substituteSource,
}:
let
  sources = rec {
    smach_ros = substituteSource {
      src = fetchgit {
        name = "smach_ros-source";
        url = "https://github.com/ros2-gbp/executive_smach-release.git";
        rev = "8b23163854ec3bdb35a4533132968554470c4005";
        hash = "sha256-T0yVHzrZV1N2ejjOTANcS1gUlVKrvGgoMD+On5KNoHo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "smach_ros";
  version = "3.0.3-1";
  src = sources.smach_ros;
  nativeBuildInputs = [ ament_cmake ament_cmake_python ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclpy smach smach_msgs std_msgs std_srvs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
