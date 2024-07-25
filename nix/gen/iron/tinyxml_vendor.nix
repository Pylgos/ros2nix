{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
  tinyxml,
}:
let
  sources = rec {
    tinyxml_vendor = substituteSource {
      src = fetchgit {
        name = "tinyxml_vendor-source";
        url = "https://github.com/ros2-gbp/tinyxml_vendor-release.git";
        rev = "8fa1bfa617c71ed5fdc82de6cc3a66fe1ae5da94";
        hash = "sha256-qimhNoEfSHElLNFW4RaecZw1dfVEQDSwHPMEuQGKNp4=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "URL https://downloads.sourceforge.net/project/tinyxml/tinyxml/2.6.2/tinyxml_2_6_2.tar.gz";
          to = "URL ${tinyxml_vendor-vendor_source-tinyxml_2_6_2-0}";
        }
      ];
    };
    tinyxml_vendor-vendor_source-tinyxml_2_6_2-0 = substituteSource {
      src = fetchzip {
        name = "tinyxml_vendor-vendor_source-tinyxml_2_6_2-0-source";
        url = "https://downloads.sourceforge.net/project/tinyxml/tinyxml/2.6.2/tinyxml_2_6_2.tar.gz";
        hash = "sha256-nYksyFj8nzE1IS8vKoqxI0zVpqgfieWHMU7Ke6C5oY0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tinyxml_vendor";
  version = "0.9.2-3";
  src = sources.tinyxml_vendor;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ tinyxml ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
