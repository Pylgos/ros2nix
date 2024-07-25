{
  ament_cmake,
  buildRosPackage,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp_lifecycle,
  substituteSource,
}:
let
  sources = rec {
    kinematics_interface = substituteSource {
      src = fetchgit {
        name = "kinematics_interface-source";
        url = "https://github.com/ros2-gbp/kinematics_interface-release.git";
        rev = "9fafceae3e04c9bc625ba404902e9a892e520bbf";
        hash = "sha256-MiEJy/9LOmSX0PUvgR4gxWEilRf5AzzntpUYUcJ0yz4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "kinematics_interface";
  version = "0.3.0-1";
  src = sources.kinematics_interface;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen rclcpp_lifecycle ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
