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
        rev = "8d7bf401f8148d10a5a1521ded327178323fd081";
        hash = "sha256-1xE8dXvdpadp+dNgWvwrnX01CzQV1qYRItilPNOfNJM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ur_dashboard_msgs";
  version = "2.4.8-1";
  src = sources.ur_dashboard_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ action_msgs rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
