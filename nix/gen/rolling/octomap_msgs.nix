{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    octomap_msgs = substituteSource {
      src = fetchgit {
        name = "octomap_msgs-source";
        url = "https://github.com/ros2-gbp/octomap_msgs-release.git";
        rev = "e7f6f4c35b2233c5591d0daee0976eb5b6957f4b";
        hash = "sha256-97tbZTVcZMc2CB2JAW6gn0/ABahvBbfiC3jpHDIJJ6I=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "octomap_msgs";
  version = "2.0.0-4";
  src = sources.octomap_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
