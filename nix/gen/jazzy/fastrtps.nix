{
  asio,
  buildRosPackage,
  cmake,
  fastcdr,
  fetchgit,
  fetchurl,
  fetchzip,
  foonathan_memory_vendor,
  openssl,
  python3,
  substituteSource,
  tinyxml-2,
}:
let
  sources = rec {
    fastrtps = substituteSource {
      src = fetchgit {
        name = "fastrtps-source";
        url = "https://github.com/ros2-gbp/fastrtps-release.git";
        rev = "2ed4a01f31f5e04860e4e24fedc8a4a1012a282f";
        hash = "sha256-wECFJjYb5fz4u/B375jBBUkB8xQ1njY3pIcc8pixN9g=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "fastrtps";
  version = "2.14.1-1";
  src = sources.fastrtps;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [ asio fastcdr foonathan_memory_vendor openssl python3 tinyxml-2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
