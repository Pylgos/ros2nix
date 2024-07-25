{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    moveit_resources_pr2_description = substituteSource {
      src = fetchgit {
        name = "moveit_resources_pr2_description-source";
        url = "https://github.com/ros2-gbp/moveit_resources-release.git";
        rev = "e034f0a246a5d44d4e95aa482dd6a818a02764bb";
        hash = "sha256-4eERk3ggPltXlbCVP319B+6aK7D4ZRRvKKKUwT5GtbA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_resources_pr2_description";
  version = "2.0.7-1";
  src = sources.moveit_resources_pr2_description;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
