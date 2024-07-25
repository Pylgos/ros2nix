{
  ament_cmake_ros,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  phidgets_api,
  phidgets_msgs,
  rclcpp,
  rclcpp_components,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    phidgets_digital_outputs = substituteSource {
      src = fetchgit {
        name = "phidgets_digital_outputs-source";
        url = "https://github.com/ros2-gbp/phidgets_drivers-release.git";
        rev = "19a417adb7755b9c791486703491c84a77a2e5af";
        hash = "sha256-KupijHg2trBRdHREmgsrAmrCxE0f+hnvA6BJOjIZ1Yc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "phidgets_digital_outputs";
  version = "2.3.3-1";
  src = sources.phidgets_digital_outputs;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [ launch ];
  buildInputs = [  ];
  propagatedBuildInputs = [ phidgets_api phidgets_msgs rclcpp rclcpp_components std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}