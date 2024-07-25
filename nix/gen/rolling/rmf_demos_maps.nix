{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rmf_building_map_tools,
  ros2run,
  substituteSource,
}:
let
  sources = rec {
    rmf_demos_maps = substituteSource {
      src = fetchgit {
        name = "rmf_demos_maps-source";
        url = "https://github.com/ros2-gbp/rmf_demos-release.git";
        rev = "44a07da1995bebe0c7f85ab3aeb9e51d0297575d";
        hash = "sha256-k6hNNgOSOVtmGt41Ps9lNg8RHEdUn3Qo5yne9ucQPH0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_demos_maps";
  version = "2.4.0-1";
  src = sources.rmf_demos_maps;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [ rmf_building_map_tools ros2run ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
