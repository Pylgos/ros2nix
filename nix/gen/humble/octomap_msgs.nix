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
        rev = "47ee915519d7ba2baa8f0f2044eaa2a16401b644";
        hash = "sha256-97tbZTVcZMc2CB2JAW6gn0/ABahvBbfiC3jpHDIJJ6I=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "octomap_msgs";
  version = "2.0.0-3";
  src = sources.octomap_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
