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
        rev = "d8bdc67614fa9a356fa755a82b2fe39c058b61a7";
        hash = "sha256-+O1GVT03FLT0BQc1RLdURvHNZrU+ROEY4WcY5uQ79zQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_traffic_editor_test_maps";
  version = "1.7.2-1";
  src = sources.rmf_traffic_editor_test_maps;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [ rmf_building_map_tools ros2run ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
