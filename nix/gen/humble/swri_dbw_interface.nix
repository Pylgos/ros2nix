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
    swri_dbw_interface = substituteSource {
      src = fetchgit {
        name = "swri_dbw_interface-source";
        url = "https://github.com/ros2-gbp/marti_common-release.git";
        rev = "0abc591f0c6ba331272addbda1014c36f7818ee3";
        hash = "sha256-R/3o8fpxmCNv/RZhQcYoxeioiuK0u0WprDMKuyYGpyc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "swri_dbw_interface";
  version = "3.6.1-1";
  src = sources.swri_dbw_interface;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
