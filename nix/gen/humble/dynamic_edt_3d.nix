{
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  octomap,
  substituteSource,
}:
let
  sources = rec {
    dynamic_edt_3d = substituteSource {
      src = fetchgit {
        name = "dynamic_edt_3d-source";
        url = "https://github.com/ros2-gbp/octomap-release.git";
        rev = "29c9ce0b0a49db5405883739ee1673e205511f1e";
        hash = "sha256-522JD7zQBjHhrle/McBU6igMD2aGFVJvyheYkpGEJ3g=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "dynamic_edt_3d";
  version = "1.9.8-1";
  src = sources.dynamic_edt_3d;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ octomap ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
