{
  ament_cmake,
  buildRosPackage,
  dynamixel_sdk,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  substituteSource,
}:
let
  sources = rec {
    dynamixel_workbench_toolbox = substituteSource {
      src = fetchgit {
        name = "dynamixel_workbench_toolbox-source";
        url = "https://github.com/ros2-gbp/dynamixel_workbench-release.git";
        rev = "5f17ace14424a7b39bd2272456c0aa29051cccc1";
        hash = "sha256-nOIZ6YHjctUbm0SxTewtbsAXlfG10kknrKhpsVPGR5k=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "dynamixel_workbench_toolbox";
  version = "2.2.3-1";
  src = sources.dynamixel_workbench_toolbox;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ dynamixel_sdk rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
