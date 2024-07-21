{
  ament_cmake,
  buildRosPackage,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  kdl_parser,
  nlopt,
  pkg-config,
  rclcpp,
  substituteSource,
  urdf,
}:
let
  sources = rec {
    trac_ik_lib = substituteSource {
      src = fetchgit {
        name = "trac_ik_lib-source";
        url = "https://github.com/ros2-gbp/trac_ik-release.git";
        rev = "7caceeb979beee59aa99202a48575b16fc72918c";
        hash = "sha256-RHtJG5zWq6hgg1ylgO5tkkidAlHTg7G+wMzeoB8s6p8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "trac_ik_lib";
  version = "2.0.1-1";
  src = sources.trac_ik_lib;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ pkg-config ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen geometry_msgs kdl_parser nlopt rclcpp urdf ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
