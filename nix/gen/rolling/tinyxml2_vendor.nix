{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
  tinyxml-2,
}:
let
  sources = rec {
    tinyxml2_vendor = substituteSource {
      src = fetchgit {
        name = "tinyxml2_vendor-source";
        url = "https://github.com/ros2-gbp/tinyxml2_vendor-release.git";
        rev = "141f943e8a56d4445d631696658690d2fe25c311";
        hash = "sha256-JcopBYS3JtmhMOyufT16RtNIUMAMMn7/mt00AcXLyXs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tinyxml2_vendor";
  version = "0.10.0-1";
  src = sources.tinyxml2_vendor;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ tinyxml-2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}