{
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  iceoryx_hoofs,
  iceoryx_posh,
  ncurses,
  substituteSource,
}:
let
  sources = rec {
    iceoryx_introspection = substituteSource {
      src = fetchgit {
        name = "iceoryx_introspection-source";
        url = "https://github.com/ros2-gbp/iceoryx-release.git";
        rev = "d7ecb8fb19c0b514b7f38ac4a04a245274fe996c";
        hash = "sha256-CQJ3hBCcrotZK6RXc42VUx+ZWcAJfXVoSQDC3eKzLi4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "iceoryx_introspection";
  version = "2.0.5-1";
  src = sources.iceoryx_introspection;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ iceoryx_hoofs iceoryx_posh ncurses ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
