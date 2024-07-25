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
        rev = "6b8b38aafb29fe856003b912147eb2c8e0649cc7";
        hash = "sha256-nHsj2A46ErUr/Q/UFaeQkJBl6kjo6xwZGGnK0iZuzOk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "fastrtps";
  version = "2.6.8-1";
  src = sources.fastrtps;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ asio fastcdr foonathan_memory_vendor openssl python3 tinyxml-2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
