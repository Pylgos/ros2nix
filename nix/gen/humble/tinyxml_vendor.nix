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
        rev = "cf95f13d79fde833aaab628c20a546095dea500b";
        hash = "sha256-RlXNKAUDO4E63XC+Ghp1xYDhrVSCpu8qPx/YgCtQUbk=";
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
  version = "0.8.3-2";
  src = sources.tinyxml_vendor;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ tinyxml ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
