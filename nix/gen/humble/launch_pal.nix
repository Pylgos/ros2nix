{
  ament_copyright,
  ament_flake8,
  ament_index_python,
  ament_pep257,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch_ros,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    launch_pal = substituteSource {
      src = fetchgit {
        name = "launch_pal-source";
        url = "https://github.com/pal-gbp/launch_pal-release.git";
        rev = "cf0aea3d2220dbb382da9c4fd5e10c7d0eb9ddf1";
        hash = "sha256-G4mxW9HGKcdnvx5PKTveoJxN5LzfmmEG6Ug1PvYIXjw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "launch_pal";
  version = "0.1.15-1";
  src = sources.launch_pal;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_index_python launch buildPackages.python3Packages.pyyaml ];
  buildInputs = [  ];
  propagatedBuildInputs = [ launch_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
