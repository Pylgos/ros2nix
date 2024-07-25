{
  ament_cmake,
  ament_lint_auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
  urdf_launch,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    urdf_tutorial = substituteSource {
      src = fetchgit {
        name = "urdf_tutorial-source";
        url = "https://github.com/ros2-gbp/urdf_tutorial-release.git";
        rev = "5494125042f54bf83c5c6c61271236a0cd805dd4";
        hash = "sha256-is2/qeO2wFsbEBxJ8Kf0u+3EkFtbejI8nZpazjXVziM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "urdf_tutorial";
  version = "1.1.0-1";
  src = sources.urdf_tutorial;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ urdf_launch ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
