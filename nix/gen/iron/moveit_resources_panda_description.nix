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
    moveit_resources_panda_description = substituteSource {
      src = fetchgit {
        name = "moveit_resources_panda_description-source";
        url = "https://github.com/ros2-gbp/moveit_resources-release.git";
        rev = "958479257265c3eb98403a4c037e19e9bedd6fd5";
        hash = "sha256-tZmobPLnHgU3DwXUGSX7/YCuWATEca5+d6GzvKzmWVk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_resources_panda_description";
  version = "2.1.1-1";
  src = sources.moveit_resources_panda_description;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
