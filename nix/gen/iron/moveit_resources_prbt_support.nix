{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
  xacro,
}:
let
  sources = rec {
    moveit_resources_prbt_support = substituteSource {
      src = fetchgit {
        name = "moveit_resources_prbt_support-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "b2b47b7bdd08e3d83973f57fb27153f2df21c7c9";
        hash = "sha256-rXYMY7epF7UuS3BWIcs2H5AJVTK0PX+PEGGKtSQ01CM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_resources_prbt_support";
  version = "2.8.0-1";
  src = sources.moveit_resources_prbt_support;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
