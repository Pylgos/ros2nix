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
        rev = "b86f4558742f46d10801b036e2d1228331563af8";
        hash = "sha256-jPq2iV+MtTFq5B4MCLJjKI/StQkXxFrWlgbsRJAliMw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ur_dashboard_msgs";
  version = "2.3.9-1";
  src = sources.ur_dashboard_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ action_msgs rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
