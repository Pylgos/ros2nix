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
        rev = "5320b1fe9c09ee3ffb526b2aec052c8af9478f38";
        hash = "sha256-2nb0wbZXcEQHUZUjAaj1P03TuBjnhJD5G6W9r4FPOT8=";
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
  version = "3.1.2-1";
  src = sources.libcurl_vendor;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ curl pkg-config ];
  buildInputs = [  ];
  propagatedBuildInputs = [ file ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
