{
  ament_cmake,
  buildRosPackage,
  curl,
  fetchgit,
  fetchurl,
  fetchzip,
  file,
  pkg-config,
  substituteSource,
}:
let
  sources = rec {
    libcurl_vendor = substituteSource {
      src = fetchgit {
        name = "libcurl_vendor-source";
        url = "https://github.com/ros2-gbp/resource_retriever-release.git";
        rev = "dddad06006be6aca430ceb3dccea9f12de11c384";
        hash = "sha256-rBKaXBI2vsbOUomT/7fu+yhC1Fgl8OU4RKve53M3SFM=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "URL https://github.com/curl/curl/releases/download/curl-7_81_0/curl-7.81.0.tar.gz";
          to = "URL ${libcurl_vendor-vendor_source-curl-7-0}";
        }
      ];
    };
    libcurl_vendor-vendor_source-curl-7-0 = substituteSource {
      src = fetchzip {
        name = "libcurl_vendor-vendor_source-curl-7-0-source";
        url = "https://github.com/curl/curl/releases/download/curl-7_81_0/curl-7.81.0.tar.gz";
        hash = "sha256-M7WqwP0fyguHoi4ObDOAqJODLkb9hqjHI9cGMoJ9YQ0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "libcurl_vendor";
  version = "3.2.2-3";
  src = sources.libcurl_vendor;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ curl pkg-config ];
  buildInputs = [  ];
  propagatedBuildInputs = [ file ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
