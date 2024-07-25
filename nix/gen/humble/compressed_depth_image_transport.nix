{
  ament_cmake,
  buildRosPackage,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  image_transport,
  substituteSource,
}:
let
  sources = rec {
    compressed_depth_image_transport = substituteSource {
      src = fetchgit {
        name = "compressed_depth_image_transport-source";
        url = "https://github.com/ros2-gbp/image_transport_plugins-release.git";
        rev = "0d8e742e03827253ef7281d5a5559b6379a9e8a9";
        hash = "sha256-mCtSS+v60aq3f5+j1OFsmajUytND396n2WjZJTn77XE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "compressed_depth_image_transport";
  version = "2.5.1-1";
  src = sources.compressed_depth_image_transport;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cv_bridge image_transport ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
