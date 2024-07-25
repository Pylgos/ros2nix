{
  ament_cmake_ros,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  phidgets_api,
  rclcpp,
  rclcpp_components,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    phidgets_temperature = substituteSource {
      src = fetchgit {
        name = "phidgets_temperature-source";
        url = "https://github.com/ros2-gbp/phidgets_drivers-release.git";
        rev = "fc3ee76fc1105749b3b85a873a94f65b3cabba36";
        hash = "sha256-AUCf5/QLj4oi3q8yB/SIYcdPJoog9kG0irWiQraVKgQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "phidgets_temperature";
  version = "2.3.3-1";
  src = sources.phidgets_temperature;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [ launch ];
  buildInputs = [  ];
  propagatedBuildInputs = [ phidgets_api rclcpp rclcpp_components std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
