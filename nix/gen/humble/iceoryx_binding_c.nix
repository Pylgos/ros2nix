{
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  iceoryx_hoofs,
  iceoryx_posh,
  substituteSource,
}:
let
  sources = rec {
    iceoryx_binding_c = substituteSource {
      src = fetchgit {
        name = "iceoryx_binding_c-source";
        url = "https://github.com/ros2-gbp/iceoryx-release.git";
        rev = "f8b5985115fdd92947f814e081e425a411c27173";
        hash = "sha256-MK/r8dSrJHO5SjuOTcRVaAOT5E8CXs0vOCivgRvoAbA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "iceoryx_binding_c";
  version = "2.0.5-1";
  src = sources.iceoryx_binding_c;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ iceoryx_hoofs iceoryx_posh ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
