{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  ros_environment,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    mqtt_client_interfaces = substituteSource {
      src = fetchgit {
        name = "mqtt_client_interfaces-source";
        url = "https://github.com/ros2-gbp/mqtt_client-release.git";
        rev = "d265ec27efb8f76e516b95f3725ef3d3c740c4b0";
        hash = "sha256-uodTNl9Jgjak1DPQpOe1aOEwSCdyfYY8zvExpOctHJE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mqtt_client_interfaces";
  version = "2.3.0-1";
  src = sources.mqtt_client_interfaces;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ros_environment rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
