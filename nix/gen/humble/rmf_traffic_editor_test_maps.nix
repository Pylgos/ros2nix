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
    rmf_traffic_editor_test_maps = substituteSource {
      src = fetchgit {
        name = "rmf_traffic_editor_test_maps-source";
        url = "https://github.com/ros2-gbp/rmf_traffic_editor-release.git";
        rev = "e2422794d1ead515ee1db794624ff3e20bf34b13";
        hash = "sha256-IvfcsSKsCTscfG4UlVTBH08VWH0J9EThP00uBFpv9N0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_traffic_editor_test_maps";
  version = "1.6.2-1";
  src = sources.rmf_traffic_editor_test_maps;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [ rmf_building_map_tools ros2run ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
