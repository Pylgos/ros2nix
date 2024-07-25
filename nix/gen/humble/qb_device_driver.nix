{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  qb_device_msgs,
  rclcpp,
  substituteSource,
}:
let
  sources = rec {
    qb_device_driver = substituteSource {
      src = fetchgit {
        name = "qb_device_driver-source";
        url = "https://bitbucket.org/qbrobotics/qbdevice-ros2-release.git";
        rev = "f8dc00d97b37cd0973245eeb4396f5e1cada2efe";
        hash = "sha256-wKNzkrrw66vacMpqWNS9oaioWP0UAgYEYylzAP2QUdE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "qb_device_driver";
  version = "4.1.3-1";
  src = sources.qb_device_driver;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ qb_device_msgs rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
