{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
  urdf,
  xacro,
}:
let
  sources = rec {
    kuka_resources = substituteSource {
      src = fetchgit {
        name = "kuka_resources-source";
        url = "https://github.com/ros2-gbp/kuka_robot_descriptions-release.git";
        rev = "86214956f6f15b57dd04f5f69127e5b75324b597";
        hash = "sha256-tIdH9nwRqgRR6CCY+lfBxD9iPHTTeQZcvFI1nu3Eo2w=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "kuka_resources";
  version = "0.9.0-2";
  src = sources.kuka_resources;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ urdf xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
