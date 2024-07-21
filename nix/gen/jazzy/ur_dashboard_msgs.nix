{
  action_msgs,
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    ur_dashboard_msgs = substituteSource {
      src = fetchgit {
        name = "ur_dashboard_msgs-source";
        url = "https://github.com/ros2-gbp/Universal_Robots_ROS2_Driver-release.git";
        rev = "15b585b54c372f5405228ac09c9b1ea4fde4f30f";
        hash = "sha256-cpkc8b9rEAO2IBjUSxUIpDLD4qK35Vv/5uj4LCvZsZE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ur_dashboard_msgs";
  version = "2.4.5-1";
  src = sources.ur_dashboard_msgs;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ action_msgs rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
