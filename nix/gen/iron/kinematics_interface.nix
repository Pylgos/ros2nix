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
        rev = "1012fe12d1a1a96ba1ee5d739267fd4e36f28a02";
        hash = "sha256-NIcnxxLBdixzZQeXN0f2g03lIQQMoKqYrwTiwVagNSE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "kinematics_interface";
  version = "1.1.0-1";
  src = sources.kinematics_interface;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen rclcpp_lifecycle ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
