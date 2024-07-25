{
  action_msgs,
  ament_cmake,
  ament_lint_common,
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
    twist_mux_msgs = substituteSource {
      src = fetchgit {
        name = "twist_mux_msgs-source";
        url = "https://github.com/ros2-gbp/twist_mux_msgs-release.git";
        rev = "3afa3546fed35690564d6999662d151614b42ac3";
        hash = "sha256-ILOj3MizVk8mZox4k3XDTrx1z7e20vK78J+4k6OuLx8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "twist_mux_msgs";
  version = "3.0.1-1";
  src = sources.twist_mux_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ action_msgs rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}