{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  realsense2_description,
  substituteSource,
  velodyne_description,
}:
let
  sources = rec {
    clearpath_sensors_description = substituteSource {
      src = fetchgit {
        name = "clearpath_sensors_description-source";
        url = "https://github.com/clearpath-gbp/clearpath_common-release.git";
        rev = "06f623e0dcad2a84f1c33102175484f73cc9ff9e";
        hash = "sha256-aNFfhoTordEKAM5o3sD1wGHwm4NO7yxcl0HyLxawzuQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "clearpath_sensors_description";
  version = "0.2.9-1";
  src = sources.clearpath_sensors_description;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ realsense2_description velodyne_description ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
