{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    ament_index_python = substituteSource {
      src = fetchgit {
        name = "ament_index_python-source";
        url = "https://github.com/ros2-gbp/ament_index-release.git";
        rev = "f98813b0b960e6cf87d45f2001db155e56fa7025";
        hash = "sha256-4wOyBJ1FcHtOdszdXIw6b4NggCFI9RNMNBIb6CAne5k=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_index_python";
  version = "1.5.2-4";
  src = sources.ament_index_python;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
