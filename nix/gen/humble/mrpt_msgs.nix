{
  ament_cmake,
  ament_cppcheck,
  ament_cpplint,
  ament_lint_auto,
  ament_lint_cmake,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  ros_environment,
  rosidl_default_generators,
  rosidl_default_runtime,
  sensor_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    mrpt_msgs = substituteSource {
      src = fetchgit {
        name = "mrpt_msgs-source";
        url = "https://github.com/ros2-gbp/mrpt_msgs-release.git";
        rev = "41b3d4e66bf8dc3ef1243d3518773135fe675f43";
        hash = "sha256-aWWfgmGZaX5Hai0iTV9oUl1V2Gz9/csFD9tIVQdlPRE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mrpt_msgs";
  version = "0.4.7-1";
  src = sources.mrpt_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ros_environment rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs rosidl_default_runtime sensor_msgs std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
