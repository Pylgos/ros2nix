{
  action_msgs,
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_core_runtime,
  service_msgs,
  substituteSource,
}:
let
  sources = rec {
    rosidl_default_runtime = substituteSource {
      src = fetchgit {
        name = "rosidl_default_runtime-source";
        url = "https://github.com/ros2-gbp/rosidl_defaults-release.git";
        rev = "995c0b7bdcc55a2c7abc3d10dc78304d4861aae9";
        hash = "sha256-vneRgRPcXzKQ1e7W+ILz8PKoMce9tpo+BbLVhTwY3As=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_default_runtime";
  version = "1.5.0-3";
  src = sources.rosidl_default_runtime;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ action_msgs rosidl_core_runtime service_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
