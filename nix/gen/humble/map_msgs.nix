{
  ament_cmake,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  nav_msgs,
  rosidl_default_generators,
  rosidl_default_runtime,
  sensor_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    map_msgs = substituteSource {
      src = fetchgit {
        name = "map_msgs-source";
        url = "https://github.com/ros2-gbp/navigation_msgs-release.git";
        rev = "be547d6e82ac554c277b816e166ca81d725ac072";
        hash = "sha256-cSeyqhHbFCEKh+19DvBtK0jHQGhHk3P6eAgwkY7+Bls=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "map_msgs";
  version = "2.1.0-3";
  src = sources.map_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ nav_msgs rosidl_default_runtime sensor_msgs std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
