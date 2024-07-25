{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  ros_base,
  ros_ign_bridge,
  ros_ign_gazebo,
  ros_ign_image,
  ros_ign_interfaces,
  substituteSource,
}:
let
  sources = rec {
    simulation = substituteSource {
      src = fetchgit {
        name = "simulation-source";
        url = "https://github.com/ros2-gbp/variants-release.git";
        rev = "a366f27b0c9075852c24642a8f5853546bf04da7";
        hash = "sha256-bvicFtHnIqmwZPfpdtNprdkWQWqSKGs+cezebLL0sUs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "simulation";
  version = "0.10.0-3";
  src = sources.simulation;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ros_base ros_ign_bridge ros_ign_gazebo ros_ign_image ros_ign_interfaces ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
