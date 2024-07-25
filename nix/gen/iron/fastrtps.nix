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
        rev = "066fd1a5e13a85d2372c305bce5036d722a4051f";
        hash = "sha256-amH1pI9aOV/G4VT5oLbYuOypiJM0+gZFmXlICiDaVS0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "fastrtps";
  version = "2.10.4-1";
  src = sources.fastrtps;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ asio fastcdr foonathan_memory_vendor openssl python3 tinyxml-2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
