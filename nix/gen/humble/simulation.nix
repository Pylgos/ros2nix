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
        rev = "344e6c8287249596d9e6013cf3e8371b0c254d2c";
        hash = "sha256-bvicFtHnIqmwZPfpdtNprdkWQWqSKGs+cezebLL0sUs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "simulation";
  version = "0.10.0-1";
  src = sources.simulation;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ros_base ros_ign_bridge ros_ign_gazebo ros_ign_image ros_ign_interfaces ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
